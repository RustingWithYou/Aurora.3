/datum/ghostspawner/human/ert/einstein
	name = "Einstein Engines Asset Protection"
	short_name = "ee_ert"
	desc = "A responder from an Einstein Engines asset protection squad."
	max_count = 2
	welcome_message = "You are a member of an Einstein Engines heavy asset protection squad. You have recieved a distress call, and been dispatched to investigate. Obey your commander's orders."
	outfit = /obj/outfit/admin/ert/einstein
	possible_species = list(SPECIES_HUMAN)
	assigned_role = "Asset Protection (Einstein)"

/datum/ghostspawner/human/ert/einstein/medical
	name = "Einstein Engines Medical Specialist"
	short_name = "ee_ertm"
	desc = "A medical specialist from an Einstein Engines asset protection squad."
	max_count = 1
	outfit = /obj/outfit/admin/ert/einstein/medic

/datum/ghostspawner/human/ert/einstein/engineer
	name = "Einstein Engines Engineering Specialist"
	short_name = "ee_erte"
	desc = "An engineering specialist from an Einstein Engines asset protection squad."
	max_count = 1
	outfit = /obj/outfit/admin/ert/einstein/engi

/datum/ghostspawner/human/ert/einstein/leader
	name = "Einstein Engines Squad Leader"
	short_name = "ee_ertl"
	desc = "The commander of a Einstein Engines asset protection squad."
	max_count = 1
	outfit = /obj/outfit/admin/ert/einstein/lead
	welcome_message = "You are the commander of an Einstein Engines heavy asset protection squad. You have recieved a distress call, and been dispatched to investigate. Lead your team."
	assigned_role = "Asset Protection Commander (Einstein)"
