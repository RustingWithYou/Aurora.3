/obj/structure/bed/stool/chair/remote/human
	name = "virtual reality centre"
	desc = "A comfortable chair with full audio-visual transposition centres. This one gives you access to a virtual reality body."
	var/outfit

/obj/structure/bed/stool/chair/remote/human/user_buckle(mob/user)
	..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		do_avatar(H)

/obj/structure/bed/stool/chair/remote/human/proc/do_avatar(var/mob/living/carbon/human/H)
	SSvirtualreality.create_virtual_reality_avatar(H)

/obj/structure/bed/stool/chair/remote/human/kataphract
	name = "virtual reality centre (kataphract knight)"
	outfit = /obj/outfit/admin/kataphract_vr

/obj/structure/bed/stool/chair/remote/human/kataphract/do_avatar(mob/living/carbon/human/H)
	SSvirtualreality.create_virtual_reality_avatar_kataphract(H, outfit)

/obj/structure/bed/stool/chair/remote/human/kataphract/heavy
	name = "virtual reality centre (kataphract heavy)"
	outfit = /obj/outfit/admin/kataphract_vr/heavy

/obj/structure/bed/stool/chair/remote/human/kataphract/klax
	name = "virtual reality centre (k'laxan kataphract)"
	outfit = /obj/outfit/admin/kataphract_vr/klax

/obj/structure/bed/stool/chair/remote/human/kataphract/klax/do_avatar(mob/living/carbon/human/H)
	SSvirtualreality.create_virtual_reality_avatar_klax(H, outfit)

/obj/structure/bed/stool/chair/remote/human/izharshan
	name = "virtual reality centre (izharshan pirate)"
	outfit = /obj/outfit/admin/izharshan_vr

/obj/structure/bed/stool/chair/remote/human/izharshan/do_avatar(mob/living/carbon/human/H)
	SSvirtualreality.create_virtual_reality_avatar_izharshan(H, outfit)

/obj/structure/bed/stool/chair/remote/human/izharshan/captain
	name = "virtual reality centre (izharshan pirate captain)"
	outfit = /obj/outfit/admin/izharshan_vr/captain
