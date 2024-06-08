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
	desc = "A terminal designed to collect and process environmental data, often used by Zeng-Hu planetary survey teams. Bioscanner and survey probe reports, as well as various samples, papers, and data disks from the area, can be inserted into this terminal in order to collect a complete environmental survey of the region."
	desc_info = "There are many scannable and sampleable items within the Kazseres region. Though duplicate data can still be added, a more complete report will be provided if you bring a wide variety of samples. How thorough your exploration and research is will affect both the final result of the analysis, and the future of Kazseres. Explore, and see what you can find."
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
	desc = "A piece of paper. It may be of use for an analysis of the region's geology."

/obj/item/paper/fluff/dam
	name = "Maintenance Schedule"
	language = LANGUAGE_UNATHI
	info = "Night crew - APC for the control level is on the fritz again. Don't touch it, it needs a new power control module. Told the boss to order one in from Kutah. If it doesn't get replaced the whole thing will start to corrode, and then we'll need to install a whole new one. You want to be on the hook for that? No? Then DON'T TOUCH IT. Yours, Guildsman Z'krez."

/obj/item/paper/fluff/dam_gen
	name = "RE: Replacement Backup Generator"
	language = LANGUAGE_UNATHI
	info = "We understand the necessity of an appropriate emergency power supply for the Kazseres Hydroelectric Dam's control level in the event of a system failure. Due to current construction efforts in the region and issues with dam output in recent years, this may be delayed until Guild resources can be allocated appropriately. Your replacement should be dispatched as soon as possible. Thank you for your services to Junzi Electric."

/obj/item/paper/fluff/dam_office
	name = "Farewell"
	language = LANGUAGE_AZAZIBA
	info = "Dearest Chaptermaster J'kar.<br>I write this letter as my spirit roars in pain, for the last thing that I would wish to do is cause harm to one who has been such a dear friend to me. I have put in for a position with the Hephaestus Guild in Kutah, and my transfer has been accepted. I am sorry to leave my home, the chapter, and you who have done so much for me - but there is no more work here save the mines, and I want a better life for my hatchlings, myself, and the one I love than that. We leave for Kutah in Versakh - I hope that you can forgive me this, and I swear before the spirits of the stones that I will never forget the kindness that you showed a brash young warrior. When I came down from my Lonely Crusade and declared my soul that of a healer, I will not forget how you embraced me and laughed, nor how I found such delight in understanding the spirits of our world with you. Should you ever come to Kutah, seek me out once more - we will share xuizi as we did in the brightest of days, and talk fondly on memories of our home.<br>\
	Your ever-stubborn student,<br>\
	<i>Akhna Oz'at</i>"

/obj/item/paper/fluff/dam_last
	name = "Our Condolences"
	language = LANGUAGE_UNATHI
	info = "Chaptermaster J'kar. We regret to inform you that due to the esablishment of the Guild's newest fusion plant, the output of Kazseres Hydroelectric Dam is no longer required. As such, the local chapter of Junzi Electric under your leadership is to be dissolved. Your chapter's remaining members, including yourself, may be offered positions elsewhere in future correspondence. You have served with honor and pride for thirty years, and whatever position is offered to you will surely be one of great distinction.<br>\
	SENT FROM: JUNZI ELECTRIC, KUTAH CHAPTER"

/obj/item/paper/fluff/lovers
	name = "Soon"
	language = LANGUAGE_AZAZIBA
	info = "Dearest Akhna, who carries my heart in your claws<br>\
	I know that it is hard to leave the Guild in Kazseres, and Guildmaster J'kar has ever been an honorable friend to us. They will understand, and in time they will forgive you. My boat arrived as of my writing this, and I have taken rooms in an inn until I can find work here. I have heard that the young Lady Hutay'zai has need of new servants, and my time serving our Lord in Kazseres should prove a high recommendation. I await your arrival in Kutah, my love, that we and our hatchlings yet-to-come may build a life for ourselves here.<br>\
	Yours, until the stars should fade,<br>\
	<i>Sosak Yrhul</i>"

//Corpses
/obj/effect/landmark/corpse/watch
	name = "Kazseres Watchman"
	species = SPECIES_UNATHI
	corpseuniform = /obj/item/clothing/under/unathi/white
	corpseshoes = /obj/item/clothing/shoes/sandals/caligae/socks
	corpsebelt = /obj/item/storage/belt/security
	corpsesuit = /obj/item/clothing/suit/armor/carrier/generic
	corpseid = TRUE
	corpseidjob = "Kazseres Watchman"

/obj/effect/landmark/corpse/watch/do_extra_customization(mob/living/carbon/human/M)
	. = ..()
	var/obj/item/projectile/P = new /obj/item/projectile/bullet/pistol/medium/ap(get_turf(M))
	P.shot_from = "spitter pistol"
	P.launch_projectile(M, BP_HEAD)
	var/obj/item/organ/external/head/O = M.organs_by_name[BP_HEAD]
	O.take_damage(80, 0, DAMAGE_FLAG_BULLET, "spitter pistol")
	M.change_skin_color(27,50,27)
	M.change_hair_color(222, 194, 162)

/obj/effect/landmark/corpse/miner
	name = "Kazseres Miner"
	species = SPECIES_UNATHI
	corpseuniform = /obj/item/clothing/under/unathi/himation/white
	corpsesuit = /obj/item/clothing/accessory/poncho/unathimantle/miner/brown
	corpseshoes = /obj/item/clothing/shoes/workboots/toeless/brown
	corpsehelmet = /obj/item/clothing/head/hardhat
	corpsemask = /obj/item/clothing/mask/dust
	corpseglasses = /obj/item/clothing/glasses/safety/goggles

/obj/effect/landmark/corpse/miner/do_extra_customization(mob/living/carbon/human/M)
	M.ChangeToHusk()
	M.adjustBruteLoss(rand(100,300))

/obj/effect/landmark/corpse/inspector
	name = "Mine Inspector"
	species = SPECIES_UNATHI
	corpseuniform = /obj/item/clothing/under/unathi/white
	corpsesuit = /obj/item/clothing/accessory/poncho/unathimantle/hephaestus/brown
	corpseshoes = /obj/item/clothing/shoes/sandals/caligae/socks
	corpsehelmet = /obj/item/clothing/head/hardhat/green
	corpsemask = /obj/item/clothing/mask/dust
	corpseglasses = /obj/item/clothing/glasses/safety/goggles

/obj/effect/landmark/corpse/inspector/do_extra_customization(mob/living/carbon/human/M)
	M.ChangeToHusk()
	M.adjustBruteLoss(rand(100,300))

//Dam Control Terminal
/obj/machinery/computer/terminal/dam_control
	name = "dam control terminal"
	desc = "This terminal is labeled as \"DAM CONTROL\". A thick layer of dust covers its screen."
	icon_screen = "mass_driver"
	icon_keyboard = "tech_key"
	var/used = FALSE
	var/has_disk = TRUE

/obj/machinery/computer/terminal/dam_control/get_examine_text(mob/user)
	. = ..()
	if(stat & NOPOWER)
		. += "The screen is dark and unresponsive. It does not appear to have power."
	else
		. += "The screen displays flashing Sinta'Unathi text."
	if(used)
		if(GLOB.all_languages[LANGUAGE_UNATHI] in user.languages)
			. += "It reads: \"FLOODGATE FAILSAFE ENGAGED - SYSTEM REBOOTING. ETD: 89 HOURS."
	else
		if(GLOB.all_languages[LANGUAGE_UNATHI] in user.languages)
			. += "It reads: \"CRITICAL SYSTEM FAILURES DETECTED. RECOMMENDED COURSE OF ACTION - SEAL FLOODGATES AND CONTACT A QUALIFIED JUNZI ELECTRIC GUILDSMAN FOR FULL DAMAGE ASSESSMENT.\""


/obj/machinery/computer/terminal/dam_control/attack_hand(mob/user)
	if(..())
		return
	if(stat & (NOPOWER|BROKEN))
		return
	if(used && !has_disk)
		to_chat(user, SPAN_NOTICE("The terminal flashes an error - it appears the system is unresponsive at this time."))
		return
	if(used && has_disk)
		var/disk = tgui_alert(user, "External disk storage full. Eject?", "Dam Control", list("Eject","Cancel"))
		if(disk == "Eject")
			visible_message(SPAN_NOTICE("\The [src] ejects a small disk."))
			var/obj/item/disk/mcguffin1/D = new /obj/item/disk/mcguffin1(get_turf(src))
			user.put_in_hands(D)
			has_disk = FALSE
	var/choice = "Cancel"
	if(has_disk)
		choice = tgui_alert(user, "Major system failures detected. External data disk full. Recommended action: Seal floodgates. Proceed?", "Dam Control", list("Seal Floodgates","Eject Disk", "Cancel"))
	else
		choice = tgui_alert(user, "Major system failures detected. Recommended action: Seal floodgates. Proceed?", "Dam Control", list("Seal Floodgates","Cancel"))
	if(choice == "Seal Floodgates")
		playsound(loc, 'sound/misc/bloblarm.ogg', 50)
		var/area/lake = GLOB.areas_by_type[/area/new_blades/lake]
		if(istype(lake))
			for(var/turf/simulated/floor/exoplanet/grass/moghes/T in lake)
				CHECK_TICK
				T.ChangeTurf(/turf/simulated/floor/exoplanet/water/shallow/moghes)
				T.set_light(4, 5, COLOR_WHITE)
		var/area/outflow = GLOB.areas_by_type[/area/new_blades/outflow]
		if(istype(outflow))
			for(var/turf/simulated/floor/exoplanet/water/shallow/moghes/T in outflow)
				CHECK_TICK
				T.ChangeTurf(/turf/simulated/floor/exoplanet/grass/moghes/dirt)
				T.set_light(4, 5, COLOR_WHITE)
		to_world(SPAN_DANGER("You hear the roaring of distant machinery, and the sudden sound of rushing water!"))
		used = TRUE
	else if(choice == "Eject Disk")
		visible_message(SPAN_NOTICE("\The [src] ejects a small disk."))
		var/obj/item/disk/mcguffin1/D = new /obj/item/disk/mcguffin1(get_turf(src))
		user.put_in_hands(D)
		has_disk = FALSE
