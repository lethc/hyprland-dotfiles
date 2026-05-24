local config = require("config.variable")

-- MONITOR
hl.monitor({
	output = config.external_monitor,
	mode = "preferred",
	position = "0x0",
	scale = 1,
})
hl.monitor({
	output = config.laptop_monitor,
	-- disabled = true,
	-- reserved_area = { top = 10, bottom = 10, left = 0, right = 0 },
	-- next to external monitor
	-- position = "1920x312",
	mode = "preferred",
	position = "4860x1080",
	scale = 1,
})
