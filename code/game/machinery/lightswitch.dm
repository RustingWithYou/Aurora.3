// the light switch
// can have multiple per area
// can also operate on non-loc area through "otherarea" var
/obj/machinery/light_switch
	name = "light switch"
	desc = "It turns lights on and off. What are you, simple?"
	icon = 'icons/obj/machinery/button.dmi'
	icon_state = "light-p"
	anchored = 1.0
	obj_flags = OBJ_FLAG_MOVES_UNSUPPORTED
	var/on = 1
	var/area/area = null
	var/otherarea = null
	power_channel = LIGHT
	//	luminosity = 1

/obj/machinery/light_switch/Initialize()
	. = ..()
	src.area = get_area(src)

	if(otherarea)
		src.area = locate(text2path("/area/[otherarea]"))

	if(!name)
		name = "light switch ([area.name])"

	src.on = src.area.lightswitch
	addtimer(CALLBACK(src, PROC_REF(sync_lights)), 25)
	update_icon()

/obj/machinery/light_switch/update_icon()
	cut_overlays()
	if(!(stat & NOPOWER))
		holographic_overlay(src, icon, "light[on]-overlay")
		if (!light_range || light_color != on ? "#82ff4c" : "#f86060")
			set_light(2, 0.3, on ? "#82ff4c" : "#f86060")
	else if (light_range)
		set_light(FALSE)

/obj/machinery/light_switch/get_examine_text(mob/user, distance, is_adjacent, infix, suffix)
	. = ..()
	if(distance <= 1)
		. += "It is [on ? "on" : "off"]."

/obj/machinery/light_switch/attack_hand(mob/user)
	playsound(src, /singleton/sound_category/switch_sound, 30)
	on = !on
	sync_lights()
	intent_message(BUTTON_FLICK, 5)

/obj/machinery/light_switch/proc/sync_lights()
	var/area/A = get_area(src)
	if(!A)
		return

	A.lightswitch = on

	for(var/obj/machinery/light_switch/L in area)
		L.on = on
		L.update_icon()

	for (var/obj/machinery/light/L in area)
		if (on)
			L.stat &= ~POWEROFF
		else
			L.stat |= POWEROFF
		L.update()

/obj/machinery/light_switch/power_change()
	if(!otherarea)
		..()

		update_icon()

/obj/machinery/light_switch/emp_act(severity)
	. = ..()

	if(stat & (BROKEN|NOPOWER))
		return

	power_change()
