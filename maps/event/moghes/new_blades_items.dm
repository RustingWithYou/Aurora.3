//Scanner for research
/obj/item/device/scanner
	name = "biological analyzer"
	icon_state = "adv_spectrometer"
	item_state = "analyzer"
	desc = "A Zeng-Hu Pharmaceuticals proprietary biological scanner."
	desc_extended = "This is a new model of a Zeng-Hu classic, designed to analyze alien flora and fauna. Useful for providing data on the environmental conditions of an unexplored world."
	desc_info = "Simply click on a plant or animal to use this device. It will provide information on the biology and wellbeing of the life form, which can be used for wider assessment of ongoing conditions. Use it in-hand to print the most recent scan results. Certain turfs or other objects may also provide scan data. Data can be uploaded to the Zeng-Hu Analysis Terminal located with the Nralakk Federation team."
	origin_tech = list(TECH_BIO = 1)
	w_class = ITEMSIZE_SMALL
	obj_flags = OBJ_FLAG_CONDUCTABLE
	throwforce = 0
	throw_speed = 3
	throw_range = 7
	matter = list(MATERIAL_ALUMINIUM = 30, MATERIAL_GLASS = 20)
	var/last_data
	var/form_title
	var/list/valid_types = list(
		/mob/living/simple_animal/threshbeast,
		/mob/living/simple_animal/hostile/retaliate/hegeranzi,
		/mob/living/simple_animal/hostile/shrieker,
		/mob/living/simple_animal/aquatic/fish/moghes,
		/mob/living/carbon/human/stok/moghes,
		/obj/structure/flora/tree/jungle,
		/obj/structure/flora/grass/junglegrass,
		/turf/simulated/floor/exoplanet/grass/moghes,
		/turf/simulated/floor/exoplanet/water/shallow/moghes
	)

/obj/item/device/scanner/proc/print_report_verb()
	set name = "Print Scan Report"
	set category = "Object"
	set src = usr

	if(usr.stat || usr.restrained() || usr.lying)
		return
	print_report(usr)

/obj/item/device/scanner/Topic(href, href_list)
	if(..())
		return
	if(href_list["print"])
		print_report(usr)

/obj/item/device/scanner/proc/print_report(var/mob/living/user)
	if(!last_data)
		to_chat(user, "There is no scan data to print.")
		return
	var/obj/item/paper/P = new /obj/item/paper(get_turf(src))
	P.set_content_unsafe("paper - [form_title]", "[last_data]")
	if(istype(user,/mob/living/carbon/human) && !(user.l_hand && user.r_hand))
		user.put_in_hands(P)
	playsound(loc, 'sound/bureaucracy/print.ogg', 75, 1)
	user.visible_message("\The [src] spits out a piece of paper.")
	return

/obj/item/device/scanner/attack_self(mob/user as mob)
	print_report(user)
	return 0

/obj/item/device/scanner/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!proximity_flag) return

	if(!is_type_in_list(target, valid_types) || istype(target, /turf/simulated/floor/exoplanet/grass/moghes/dirt))
		to_chat(user, SPAN_WARNING("No scan data available on \the [target]!"))
		return
	var/scan = "Scan Result: \the [target]"
	form_title = scan
	if(istype(target, /mob/living/simple_animal))
		var/mob/living/simple_animal/M = target
		scan += "<br>Info: [M.desc]"
		scan += "<br>Sex: [pick("Male","Female")]"
		scan += "<br>Age: [rand(5,30)]"
		if(M.stat == DEAD)
			scan += "<br>Physical Analysis: This specimen is recently deceased."
		else if(M.health == M.maxHealth)
			scan += "<br>Physical Analysis: This specimen appears healthy, beyond minor signs of radiation exposure."
		else if(M.health < M.maxHealth)
			scan += "<br>Physical Analysis: This specimen has suffered moderate wounds, and demonstrates minor signs of radiation exposure."
		else if(M.health < M.maxHealth*0.5)
			scan += "<br>Physical Analysis: This specimen has suffered severe wounds, and demonstrates minor signs of radiation exposure."
	else if(istype(target, /mob/living/carbon/human/stok))
		var/mob/living/carbon/human/stok/M = target
		scan += "<br>Info: The stok, often referred to by humans as a 'lizard monkey', is a small bipedal reptile native to Moghes. Their scale coloration varies regionally but generally tends to be an orange-brown, likely to blend in with the trees of Moghes' jungles. Stok are often used as test subjects by Unathi scientists due to their genetic similarity with Unathi, in a similar role to how test monkeys are used for human trials. Genetic data indicates that they may share a common ancestor with the Sinta'Unathi."
		scan += "<br>Sex: [M.gender]"
		scan += "<br>Age: [rand(5,30)]"
		if(M.stat == DEAD)
			scan += "<br>Physical Analysis: This specimen is recently deceased."
		else
			scan += "<br>Physical Analysis: Minor signs of malnutrition and radiation exposure detected."
	else
		switch(target.type)
			if(/obj/structure/flora/tree/jungle)
				scan += "<br>Info: A native tree species of the planet Moghes. Consult Zeng-Hu arborial database for further cross-referenced information."
				scan += "<br>Botanical Analysis: Nutrient levels acceptable. Water levels below nominal parameters. Recommend soil sample for further analysis."
				scan += "<br>Analysis: Minor signs of radiation exposure. Scans do not indicate any serious damage to tree's genetic structure."
				scan += "<br>Projection: Current water levels are insufficient for continued growth. Without environmental alteration, specimen lifespan projected at 1-5 years."
			if(/obj/structure/flora/grass/junglegrass, /turf/simulated/floor/exoplanet/grass/moghes)
				scan += "<br>Info: Sample of several native grasses identified as originating from the planet Moghes. Consult Zeng-Hu botanical database for further cross-referenced information."
				scan += "<br>Botanical Analysis: Water levels lower than required for sustained growth. Nutrient levels acceptable. Some grasses present in sample show signs of radioactive contamination."
				scan += "<br>Analysis: Insufficient water and radioactive contamination in soil is hampering the growth of local flora."
				scan += "<br>Projection: Minor to moderate regional defoliation projected in the next 1-5 years."
			if(/turf/simulated/floor/exoplanet/water/shallow/moghes)
				scan += "<br>Info: Water sample. pH of 7.4."
				scan += "<br>Analysis: Fresh water, likely from a river, lake, or other inland aquifer. Boiling or purification recommended before sapient consumption."
				scan += "<br>Signs of radioactive sediment detected in low quantities. Prolonged consumption may cause adverse effects."
	scan += "<br>Supply this data for analysis. Property of Zeng-Hu Pharmaceuticals."
	last_data = scan
	to_chat(user, SPAN_NOTICE("Scan complete."))
	playsound(loc, 'sound/machines/compbeep2.ogg', 25)

/obj/machinery/computer/terminal/scanner
	name = "\improper Zeng-Hu Analysis Terminal"
	desc = "A terminal designed to collect and process environmental data, often used by Zeng-Hu planetary survey teams."
	desc_info = "Bioscanner and survey probe reports, as well as various samples, papers, and data disks from the area, can be inserted into this terminal in order to collect a complete environmental survey of the region. Explore and see what you can find!"
	icon_screen = "gyrotron_screen"
	icon_keyboard = "tech_key"
	var/scan_progress = 0
	var/list/scanned = list()

/obj/machinery/computer/terminal/scanner/get_examine_text(mob/user, distance, is_adjacent, infix, suffix)
	. = ..()
	if(stat & NOPOWER)
		. += "The screen is dark and unresponsive. It does not appear to have power."
	else if (scan_progress >= 100)
		. += "The screen reads 'Scan complete, press any key to print results."
	else
		. += "The screen reads 'Scan in progress: [scan_progress]%."

/obj/machinery/computer/terminal/scanner/attack_hand(mob/user)
	if(..())
		return
	if(stat & (NOPOWER|BROKEN))
		return
	if(scan_progress >= 100)
		to_chat(user, SPAN_NOTICE("\The [src] whirs, printing a report."))
		playsound(loc, 'sound/bureaucracy/print.ogg', 75, 1)
		print_report(user)
	else
		to_chat(user, SPAN_WARNING("\The [src] requires more data!"))

/obj/machinery/computer/terminal/scanner/attackby(obj/item/attacking_item, mob/user)
	if(scan_progress >= 100)
		to_chat(user, SPAN_NOTICE("\The [src]'s scan is complete. There is no need to input further data."))
	var/firstscan = TRUE
	if(istype(attacking_item, /obj/item/paper))
		if(findtextEx(attacking_item.name, "Scan Result") ||  findtext(attacking_item.name, "survey report"))
			user.remove_from_mob(attacking_item)
			to_chat(user, SPAN_NOTICE("You insert \the [attacking_item] into \the [src]'s paper scanner'."))
			playsound(loc, 'sound/bureaucracy/scan.ogg', 75, 1)
			qdel(attacking_item)
			if(attacking_item.name in scanned)
				firstscan = FALSE
			else scanned += attacking_item.name
			if(firstscan)
				scan_progress += 5
				scan_progress = min(scan_progress, 100)
				to_chat(user, SPAN_NOTICE("New data added, scan progress increased to [scan_progress]%."))
			else
				scan_progress += 1
				scan_progress = min(scan_progress, 100)
				to_chat(user, SPAN_NOTICE("Duplicate data added, scan progress increased to [scan_progress]%."))
		else if(attacking_item.name == "Kazseres Mine Report") //unique papers with valuable data
			if("Kazseres Mine Report" in scanned)
				to_chat(user, SPAN_WARNING("This data has already been processed, no further information can be gained from it."))
			else
				scanned += "Kazseres Mine Report"
				scan_progress += 10
				scan_progress = min(scan_progress, 100)
				to_chat(user, SPAN_NOTICE("Mine analysis added to database - scan progress increased to [scan_progress]%."))
		else
			to_chat(user, SPAN_WARNING("Invalid report, no scan progress added."))
			return
	else if(istype(attacking_item, /obj/item/reagent_containers/glass/beaker))
		if(!istype(attacking_item, /obj/item/reagent_containers/glass/beaker/vial))
			to_chat(user, SPAN_WARNING("\The [attacking_item] will not fit in \the [src]'s analysis port - it looks to be sized for a small vial."))
			return
		else
			to_chat(user, SPAN_NOTICE("You insert \the [attacking_item] into \the [src]'s analysis port."))
			playsound(loc, 'sound/machines/compbeep2.ogg', 25)
			if(!attacking_item.reagents?.total_volume)
				to_chat(user, SPAN_WARNING("\The [attacking_item] contains nothing for \the [src] to analyze! With a beep, it is ejected."))
				return
			else if(attacking_item.reagents.has_reagent(/singleton/reagent/water))
				user.remove_from_mob(attacking_item)
				qdel(attacking_item)
				if("Water" in scanned)
					firstscan = FALSE
				else scanned += "Water"
				if(firstscan)
					scan_progress += 10
					scan_progress = min(scan_progress, 100)
					to_chat(user, SPAN_NOTICE("Water sample added to database, scan process increased to [scan_progress]%."))
				else
					scan_progress += 2
					scan_progress = min(scan_progress, 100)
					to_chat(user, SPAN_NOTICE("Secondary water sample added to database, scan progress increased to [scan_progress]%."))
			else
				to_chat(user, SPAN_WARNING("Invalid reagent sample. No scan data added."))
				return
	else if(istype(attacking_item, /obj/item/rocksliver))
		user.remove_from_mob(attacking_item)
		to_chat(user, SPAN_NOTICE("You insert \the [attacking_item] into \the [src]'s analysis port."))
		playsound(loc, 'sound/machines/compbeep2.ogg', 25)
		qdel(attacking_item)
		if("Rock" in scanned)
			firstscan = FALSE
		else scanned += "Rock"
		if(firstscan)
			scan_progress += 10
			scan_progress = min(scan_progress, 100)
			to_chat(user, SPAN_NOTICE("Geological sample added to database, scan process increased to [scan_progress]%."))
		else
			scan_progress += 2
			scan_progress = min(scan_progress, 100)
			to_chat(user, SPAN_NOTICE("Additional geologial sample added to database, scan progress increased to [scan_progress]%."))
	else if(istype(attacking_item, /obj/item/disk/mcguffin1))
		user.remove_from_mob(attacking_item)
		to_chat(user, SPAN_NOTICE("You insert \the [attacking_item] into \the [src]'s disk tray."))
		qdel(attacking_item)
		if("Disk" in scanned)
			to_chat(user, SPAN_WARNING("The terminal displays an error - this data has already been processed. Further analysis will be of no use."))
		else
			scanned += "Disk"
			scan_progress += 20
			scan_progress = min(scan_progress, 100)
			playsound(loc, 'sound/machines/compbeep2.ogg', 25)
			to_chat(user, SPAN_NOTICE("Hydrological data copied to database, scan progress increased to [scan_progress]%."))
	else
		to_chat(user, SPAN_WARNING("\The [src] cannot gain any useful data from \the [attacking_item]."))

/obj/machinery/computer/terminal/scanner/proc/print_report(mob/user)
	if(scan_progress < 100)
		return
	var/output = "{\[center\]\[logo_zh\]\[/center\]\
		\[center\]\[b\]\[i\]Environmental Analysis Report Summary\[/b\]\[/i\]\[hr\]\
		Environmental analysis of the Kazseres region indicates moderate ecological damage. Biological data shows that minor radiation exposure is present in local plants and animals, and that water levels are insufficient to sustain current plant life.\[br\]\
		Atmospheric analysis is clear of fallout, and soil samples indicate that radioactive contamination is light enough that the region should be fully cleared of radiation within the next few years. The region remains suitable for habitation by organic life.\[br\]"
	if(("Water" in scanned) || ("Disk" in scanned))
		output += "\[br\]Hydrological data indicates that radioactive contamination in local water supplies may cause long-term health issues to the local population. Water purification machinery will need to be set up to sustain local settlements in the long term. Fish populations will require outside introduction to maintain, but have proven largely unaffected by water contamination.\[br\]"
	if("Disk" in scanned)
		output += "\[br\]Analysis of the Kazseres Hydroelectric Dam data indicates that sealing the floodgates would be an important first step, allowing Lake Kazseres to be refilled. Fish populations could be raised to sustainable numbers with imported specimens faster, and the sealed dam will enable river transportation to Kutah to resume. The floodgates are a temporary measure, and the dam will require long-term reinforcement and repair to sustain this.\[br\]"
	if(("Kazeres Mine Report" in scanned) || ("Rock" in scanned))
		output += "\[br\]Mineral analysis indicates large ore deposits are still present in the local mine and surrounding mountains. Though the mining facility and mine itself will require repair in order to allow for safe working conditions, if reopened it would prove a source of economic opportunity for the region.\[br\]"
	output += "\[br\]Overall conclusion: Kazseres region ecological damage is reversible, and current issues in the area can be resolved within a timespan of several years. Full data has been transmitted to the SCCV Horizon central database."

	var/obj/item/paper/P = new /obj/item/paper(get_turf(src))
	P.set_content("Kazseres Region Environmental Analysis",output)
//Mcguffins and fluff papers for the scanner

/obj/item/disk/mcguffin1
	name = "dam hydrological data disk"
	icon = 'icons/obj/cloning.dmi'
	icon_state = "datadisk2"
	item_state = "card-id"
	w_class = ITEMSIZE_SMALL
	desc = "A data disk containing decades' worth of data from the Kazseres Hydroelectric Dam's operations. This could be an invaluable source of information on the region's ecological status."
	desc_info = "This data disk can be used at the Zeng-Hu Environmental Analysis Terminal for a large one-time boost to survey progress."

/obj/item/paper/fluff/mine
	name = "Kazseres Mine Report"
	language = LANGUAGE_UNATHI
	info = "Safety inspection is extremely unpromising - many of the supports in here have degraded, and the complex itself is in dire need of some cleaning. Observing the last few yield, on the other hand reports indicates that the mine could be very profitable for Hephaestus if re-opened, now that the Guild is under us.<br>\
	The mine will need to be fully swept over for safety hazards, and the complex restored - but once that's done, it could be very productive indeed. The biggest issue is transport - with Lake Kazseres drained and the river flowing south, we can't transport this back to refining facilities in Kutah easily. Connecting the town to the railroad, or repairing the dam, would be a much bigger investment.<br>\
	The supports are definitely showing their age - I shouldn't stay too long down here. Can write out a full report when I get back to town."
