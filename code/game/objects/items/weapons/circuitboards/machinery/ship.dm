#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

//Sensors
/obj/item/circuitboard/shipsensors
	name = T_BOARD("sensor suite")
	board_type = "machine"
	icon_state = "mcontroller"
	build_path = /obj/machinery/shipsensors
	origin_tech = list(TECH_POWER = 4, TECH_ENGINEERING = 5, TECH_BLUESPACE = 3)
	req_components = list(
		/obj/item/stock_parts/subspace/ansible = 1,
		/obj/item/stock_parts/subspace/filter = 1,
		/obj/item/stock_parts/subspace/treatment = 1,
		/obj/item/stock_parts/subspace/analyzer = 1,
		/obj/item/stock_parts/manipulator = 3,
		/obj/item/stack/cable_coil = 20
	)

/obj/item/circuitboard/shipsensors/weak
	name = T_BOARD("low-power sensor suite")
	build_path = /obj/machinery/shipsensors/weak
	origin_tech = list(TECH_POWER = 2, TECH_ENGINEERING = 3, TECH_BLUESPACE = 1)
	req_components = list(
		/obj/item/stock_parts/subspace/ansible = 1,
		/obj/item/stock_parts/subspace/filter = 1,
		/obj/item/stock_parts/subspace/treatment = 1,
		/obj/item/stock_parts/manipulator = 3,
		/obj/item/stack/cable_coil = 10
	)

/obj/item/circuitboard/shipsensors/strong
	name = T_BOARD("high-power sensor suite")
	build_path = /obj/machinery/shipsensors/strong
	origin_tech = list(TECH_POWER = 6, TECH_ENGINEERING = 8, TECH_BLUESPACE = 5)
	req_components = list(
		/obj/item/stock_parts/subspace/ansible = 1,
		/obj/item/stock_parts/subspace/filter = 1,
		/obj/item/stock_parts/subspace/treatment = 1,
		/obj/item/stock_parts/subspace/analyzer = 1,
		/obj/item/stock_parts/subspace/amplifier = 1,
		/obj/item/stock_parts/manipulator = 3,
		/obj/item/stack/cable_coil = 30
	)

/obj/item/circuitboard/shipsensors/venator
	name = T_BOARD("venator-class quantum sensor array")
	build_path = /obj/machinery/shipsensors/strong/venator
	origin_tech = list(TECH_POWER = 8, TECH_ENGINEERING = 10, TECH_BLUESPACE = 8, TECH_PHORON = 4)
	req_components = list(
		/obj/item/stock_parts/subspace/ansible = 1,
		/obj/item/stock_parts/subspace/filter = 1,
		/obj/item/stock_parts/subspace/treatment = 1,
		/obj/item/stock_parts/subspace/analyzer = 1,
		/obj/item/stock_parts/subspace/amplifier = 1,
		/obj/item/stock_parts/manipulator = 3,
		/obj/item/bluespace_crystal = 1,
		/obj/item/stack/cable_coil = 60
	)

//IFF
/obj/item/circuitboard/iff
	name = T_BOARD("IFF transponder")
	board_type = "machine"
	icon_state = "mcontroller"
	build_path = /obj/machinery/iff_beacon
	origin_tech = list(TECH_POWER = 4, TECH_ENGINEERING = 5, TECH_DATA = 3)
	req_components = list(
		/obj/item/stock_parts/subspace/ansible = 1,
		/obj/item/stock_parts/subspace/filter = 1,
		/obj/item/stock_parts/subspace/transmitter = 1,
		/obj/item/stack/cable_coil = 15
	)

//Engines
/obj/item/circuitboard/unary_atmos/engine
	name = T_BOARD("gas thruster")
	icon_state = "mcontroller"
	build_path = /obj/machinery/atmospherics/unary/engine
	origin_tech = list(TECH_POWER = 1, TECH_ENGINEERING = 2)
	req_components = list(
		/obj/item/stack/cable_coil = 30,
		/obj/item/pipe = 2)

/obj/item/circuitboard/engine/ion
	name = T_BOARD("ion propulsion device")
	board_type = "machine"
	icon_state = "mcontroller"
	build_path = /obj/machinery/ion_engine
	origin_tech = list(TECH_POWER = 4, TECH_ENGINEERING = 3)
	req_components = list(
		/obj/item/stack/cable_coil = 2,
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/stock_parts/capacitor = 2
	)

/obj/item/circuitboard/engine/maneuvering
	name = T_BOARD("pulse-maneuvering device")
	board_type = "machine"
	icon_state = "mcontroller"
	build_path = /obj/machinery/maneuvering_engine
	origin_tech = list(TECH_POWER = 4, TECH_ENGINEERING = 3)
	req_components = list(
		/obj/item/stack/cable_coil = 2,
		/obj/item/stock_parts/matter_bin = 1,
		/obj/item/stock_parts/capacitor = 2
	)
