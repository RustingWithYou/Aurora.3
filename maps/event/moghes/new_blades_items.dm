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
	user.visible_message("\The [src] spits out a piece of paper.")
	return

/obj/item/device/scanner/attack_self(mob/user as mob)
	print_report(user)
	return 0

/obj/item/device/scanner/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!proximity_flag) return

	if(!is_type_in_list(target, valid_types) || istype(/turf/simulated/floor/exoplanet/grass/moghes/dirt))
		to_chat(user, SPAN_WARNING("No scan data available on \the [target]!"))
		return
	var/scan = "Scan Result: \the [target]"
	form_title = scan
	switch(target.type)
		if(/mob/living/simple_animal)
			var/mob/living/simple_animal/M = target
			scan += "<br>Info: [M.desc]"
			scan += "<br>Sex: [pick("Male","Female")]"
			scan += "<br>Age: [rand(5-30)]"
			if(M.stat == DEAD)
				scan += "<br>Physical Analysis: This specimen is recently deceased."
			else if(M.health == M.maxHealth)
				scan += "<br>Physical Analysis: This specimen appears healthy, beyond minor signs of radiation exposure."
			else if(M.health < M.maxHealth)
				scan += "<br>Physical Analysis: This specimen has suffered moderate wounds, and demonstrates minor signs of radiation exposure."
			else if(M.health < M.maxHealth*0.5)
				scan += "<br>Physical Analysis: This specimen has suffered severe wounds, and demonstrates minor signs of radiation exposure."
		if(/mob/living/carbon/human/stok)
			var/mob/living/carbon/human/stok/M = target
			scan += "<br>Info: The stok, often referred to by humans as a 'lizard monkey', is a small bipedal reptile native to Moghes. Their scale coloration varies regionally but generally tends to be an orange-brown, likely to blend in with the trees of Moghes' jungles. Stok are often used as test subjects by Unathi scientists due to their genetic similarity with Unathi, in a similar role to how test monkeys are used for human trials. Genetic data indicates that they may share a common ancestor with the Sinta'Unathi."
			scan += "<br>Sex: [M.gender]"
			scan += "<br>Age: [rand(5-30)]"
			if(M.stat == DEAD)
				scan += "<br>Physical Analysis: This specimen is recently deceased."
			else
				scan += "<br>Physical Analysis: Minor signs of malnutrition and radiation exposure detected."
		if(/obj/structure/flora/tree/jungle)
			scan += "<br>Info: A native tree species of the planet Moghes. Consult Zeng-Hu arborial database for further cross-referenced information."
			scan += "<br>Botanical Analysis: Nutrient levels acceptable. Water levels below nominal parameters. Recommend soil sample for further analysis."
			scan += "<br>Analysis: Minor signs of radiation exposure. Scans do not indicate any serious damage to tree's genetic structure."
			scan += "<br>Projection: Current water levels are insufficient for continued growth. Without environmental alteration, specimen lifespan projected at 1-5 years."
		if(/obj/structure/flora/grass/junglegrass || /turf/simulated/floor/exoplanet/grass/moghes)
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
