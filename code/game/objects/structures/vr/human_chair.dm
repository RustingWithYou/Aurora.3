/obj/structure/bed/stool/chair/remote/human
	name = "virtual reality centre"
	desc = "A comfortable chair with full audio-visual transposition centres. This one gives you access to a virtual reality body."
	var/outfit

/obj/structure/bed/stool/chair/remote/human/user_buckle(mob/user)
	..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		do_avatar(H)

/obj/structure/bed/stool/chair/remote/human/proc/do_avatar(mob/living/carbon/human/H)
	SSvirtualreality.create_virtual_reality_avatar(H)

/obj/structure/bed/stool/chair/remote/human/kataphract
	name = "virtual reality centre (kataphract knight)"
	outfit = /obj/outfit/admin/kataphract_vr

/obj/structure/bed/stool/chair/remote/human/kataphract/do_avatar(mob/living/carbon/human/H)
	SSvirtualreality.create_virtual_reality_avatar_kataphract(H, outfit)

/obj/structure/bed/stool/chair/remote/human/pirate
	name = "virtual reality centre (pirate)"
	outfit = /obj/outfit/admin/pirate_vr

/obj/structure/bed/stool/chair/remote/human/pirate/do_avatar(mob/living/carbon/human/H)
	SSvirtualreality.create_virtual_reality_avatar_pirate(H, outfit)
