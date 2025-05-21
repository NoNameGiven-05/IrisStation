/obj/effect/mob_spawn/ghost_role/human/syndicatespace
	random_appearance = FALSE
	loadout_enabled = TRUE
	quirks_enabled = TRUE

/obj/effect/mob_spawn/ghost_role/human/syndicatespace/special(mob/living/spawned_mob, mob/mob_possessor)
	. = ..()
	var/mob/living/carbon/human/new_spawn = spawned_mob
	if(istype(new_spawn))
		new_spawn.grant_language(/datum/language/codespeak, source = LANGUAGE_SPAWNER)
		var/datum/job/spawn_job = SSjob.get_job_type(spawner_job_path)
		var/policy = get_policy(spawn_job.policy_index)
		if(policy)
			to_chat(new_spawn, span_bold("[policy]"))

/obj/effect/mob_spawn/ghost_role/human/syndicatespace/captain
	random_appearance = FALSE
	loadout_enabled = TRUE
	quirks_enabled = TRUE

/obj/effect/mob_spawn/ghost_role/human/syndicatespace/captain/Destroy()
	new /obj/structure/fluff/empty_sleeper/syndicate/captain(get_turf(src))
	return ..()

/datum/outfit/syndicatespace
	name = "Syndicate Ship Base"
	id = /obj/item/card/id/advanced/black/syndicate_command/crew_id
	uniform = /obj/item/clothing/under/syndicate/combat
	back = /obj/item/storage/backpack
	belt = /obj/item/storage/belt/military/assault
	ears = /obj/item/radio/headset/syndicate/alt
	gloves = /obj/item/clothing/gloves/combat
	shoes = /obj/item/clothing/shoes/combat
	implants = list(/obj/item/implant/weapons_auth)

/datum/outfit/syndicatespace/post_equip(mob/living/carbon/human/syndie_scum)
	syndie_scum.faction |= ROLE_SYNDICATE

/datum/outfit/syndicatespace/syndicrew
	name = "Syndicate Ship Crew Member"
	glasses = /obj/item/clothing/glasses/night/colorless
	mask = /obj/item/clothing/mask/gas/syndicate
	l_pocket = /obj/item/gun/ballistic/automatic/pistol
	r_pocket = /obj/item/knife/combat/survival

/datum/outfit/syndicatespace/syndicaptain
	name = "Syndicate Ship Captain"
	id = /obj/item/card/id/advanced/black/syndicate_command/captain_id
	uniform = /obj/item/clothing/under/syndicate/combat
	suit = /obj/item/clothing/suit/armor/vest/capcarapace/syndicate
	ears = /obj/item/radio/headset/syndicate/alt/leader
	head = /obj/item/clothing/head/hats/hos/beret/syndicate
	r_pocket = /obj/item/knife/combat/survival
	backpack_contents = list(
		/obj/item/documents/syndicate/red,
		/obj/item/gun/ballistic/automatic/pistol/aps,
		/obj/item/paper/fluff/ruins/forgottenship/password,
	)

/obj/effect/mob_spawn/ghost_role/human/syndicatespace/Initialize(mapload)
	. = ..()
	random_appearance = FALSE
	loadout_enabled = TRUE
	quirks_enabled = TRUE

/obj/effect/mob_spawn/ghost_role/human/syndicatespace/captain/Initialize(mapload)
	. = ..()
	random_appearance = FALSE
	loadout_enabled = TRUE
	quirks_enabled = TRUE
