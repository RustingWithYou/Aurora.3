/obj/machinery/radio_beacon
	name = "transmission beacon"
	desc = ""
	icon = 'icons/obj/machinery/beacon.dmi'
	icon_state = "beacon"
	idle_power_usage = 0
	active_power_usage = 1 KILO WATTS
	var/obj/effect/overmap/radio_signal/signal
	var/obj/effect/overmap/radio_signal/distress/emergency_signal
	var/last_message_time = 0
	var/last_activation_time = 0
	var/const/activation_cooldown = 1 MINUTE

/obj/machinery/radio_beacon/Initialize(mapload, d, populate_components, is_internal)
	..()
	return INITIALIZE_HINT_LATELOAD

/obj/machinery/radio_beacon/LateInitialize()
	if(SSatlas.current_map.use_overmap && !linked)
		var/my_sector = GLOB.map_sectors["[z]"]
		if (istype(my_sector, /obj/effect/overmap/visitable))
			attempt_hook_up(my_sector)

/obj/machinery/radio_beacon/attack_hand(mob/user)
	. = ..()
	if(use_check_and_message(user))
		return

	if(inoperable())
		to_chat(user, SPAN_WARNING("A small red light flashes on \the [src]."))
		return

	if(!linked)
		to_chat(user, SPAN_WARNING("You cannot deploy \the [src] here."))
		return

	if(last_activation_time > world.time + activation_cooldown)
		to_chat(user, SPAN_WARNING("\The [src] is still cooling down from its last activation!"))
		return

	var/toggle_prompt = tgui_alert(user, "Turn the beacon...", "[src] Options", list("[signal || emergency_signal ? "Off" : "On"]", "Cancel"))

	if(toggle_prompt == "Cancel" || !toggle_prompt)
		return

	if(QDELETED(src) || stat)
		return

	switch(toggle_prompt)
		if("On")
			if(emergency_signal)
				to_chat(user, SPAN_WARNING("Turn off the distress signal first!"))
				return
			else
				activate(user)
		if("Off")
			deactivate()


/obj/machinery/radio_beacon/proc/activate(mob/user)
	var/message = sanitize(tgui_input_text(user, "What should the beacon broadcast?", "Transmission Beacon", multiline = TRUE))
	if(!message)
		return
	user.say(message)
	visible_message(SPAN_NOTICE("\The [src] whirs to life, starting its radio broadcast."))
	playsound(src, 'sound/machines/sensors/newcontact.ogg', 50, 3, 3)
	signal = new()
	last_activation_time = world.time
	signal.message = message
	signal.set_origin(linked)

	update_use_power(POWER_USE_ACTIVE)
	update_icon()

/obj/machinery/radio_beacon/proc/activate_distress(mob/user, var/distress_message)
	visible_message(SPAN_WARNING("\The [src] beeps urgently as it whirrs to life, sending out intermittent tones."))
	log_and_message_admins("A distress beacon was activated in [get_area(user)].", user, get_turf(user))
	playsound(src, 'sound/machines/sensors/newcontact.ogg', 50, 3, 3)

	emergency_signal = new()
	last_activation_time = world.time
	emergency_signal.set_origin(linked)
	emergency_signal.message = distress_message

	update_use_power(POWER_USE_ACTIVE)
	update_icon()

/obj/machinery/radio_beacon/proc/deactivate()
	visible_message(SPAN_NOTICE("\The [src] whirs to life, starting its radio broadcast."))
	playsound(src, 'sound/machines/sensors/newcontact.ogg', 50, 3, 3)
	QDEL_NULL(signal)
	QDEL_NULL(emergency_signal)
	last_activation_time = world.time
	update_use_power(POWER_USE_OFF)
	update_icon()

/obj/machinery/radio_beacon/power_change()
	. = ..()
	if(!. || !use_power) return

	if(stat & NOPOWER)
		deactivate()

/obj/machinery/radio_beacon/update_icon()
	. = ..()
	cut_overlays()
	if(panel_open)
		add_overlay("[icon_state]_panel")
	if(!stat)
		add_overlay("[icon_state]_lights")
	if(signal)
		add_overlay("[icon_state]_lights_active")
	else if(emergency_signal)
		add_overlay("[icon_state]_lights_distress")

/obj/machinery/radio_beacon/Destroy()
	QDEL_NULL(signal)
	QDEL_NULL(emergency_signal)
	. = ..()

//Overmap effect
/obj/effect/overmap/radio_signal
	name = "radio signal"
	icon_state = "radio"
	scannable = TRUE
	color = COLOR_LIGHT_CYAN
	requires_contact = FALSE
	instant_contact = TRUE
	///The message of the radio signal
	var/message
	///The overmap object our signal is attached to
	var/obj/effect/overmap/source

/obj/effect/overmap/radio_signal/get_scan_data(mob/user)
	return list("A radio signal originating at \the [source].<br><br>\
	---BEGINNING OF TRANSMISSION---<br><br>\
	[message]\
	<br><br>---END OF TRANSMISSION---")

/obj/effect/overmap/radio_signal/proc/set_origin(var/obj/effect/overmap/origin)
	RegisterSignal(origin, COMSIG_MOVABLE_MOVED, PROC_REF(follow))
	RegisterSignal(origin, COMSIG_QDELETING, TYPE_PROC_REF(/datum, qdel_self))
	forceMove(origin.loc)
	source = origin
	pixel_x = -(origin.bound_width - 6)
	pixel_y = origin.bound_height - 6

/obj/effect/overmap/radio_signal/Destroy()
	UnregisterSignal(source, COMSIG_MOVABLE_MOVED)
	UnregisterSignal(source, COMSIG_QDELETING)
	source = null
	. = ..()

/obj/effect/overmap/radio_signal/proc/follow(atom/movable/AM, old_loc, new_loc)
	forceMove(new_loc)

/obj/effect/overmap/radio_signal/distress
	name = "distress dataspike"
	color = COLOR_RED

/obj/effect/overmap/radio_signal/distress/get_scan_data(mob/user)
	return list("A unilateral, broadband data broadcast originating at \the [source] carrying only an emergency code sequence.")
