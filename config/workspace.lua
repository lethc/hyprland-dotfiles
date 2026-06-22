local config = require("config.variable")

-- WORKSPACES
hl.workspace_rule({
	workspace = "1",
	monitor = config.external_monitor,
	default = true,
})
hl.workspace_rule({
	workspace = "name:K:extra",
	monitor = config.laptop_monitor,
    layout = "dwindle",
	default = true,
})
hl.workspace_rule({
	workspace = "name:L:extraOne",
	monitor = config.laptop_monitor,
	default = true,
})
hl.workspace_rule({
	workspace = "name:M:extraTwo",
	monitor = config.laptop_monitor,
})

hl.workspace_rule({
	workspace = "4",
	monitor = config.external_monitor,
    layout = "dwindle",
})

hl.workspace_rule({
	workspace = "special:" .. config.special_workspace1,
	no_rounding = false,
	decorate = true,
	gaps_in = 50,
	gaps_out = 50,
	no_border = false,
	persistent = true,
})
hl.workspace_rule({
	workspace = "special:" .. config.special_workspace2,
	no_rounding = false,
	decorate = true,
	gaps_in = 50,
	gaps_out = 50,
	no_border = false,
	persistent = true,
})
