

//Overmap effect
/obj/effect/overmap/radio_signal
	name = "radio signal"
	icon_state = "radio"
	scannable = TRUE
	color = COLOR_LIGHT_CYAN
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
	UnregisterSignal(origin, COMSIG_MOVABLE_MOVED)
	UnregisterSignal(origin, COMSIG_QDELETING)
	source = null
	. = ..()

/obj/effect/overmap/radio_signal/proc/follow(atom/movable/AM, old_loc, new_loc)
	forceMove(new_loc)

/obj/effect/overmap/radio_signal/distress
	name = "distress dataspike"
	color = COLOR_RED

/obj/effect/overmap/radio_signal/distress/get_scan_data(mob/user)
	return list("A unilateral, broadband data broadcast originating at \the [source] carrying only an emergency code sequence.")
