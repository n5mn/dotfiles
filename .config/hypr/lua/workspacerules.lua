-- Workspace rules

-- workspace = 1,2,3,4,5, monitor:DP-1
-- workspace = 6,7,8,9,10, monitor:HDMI-A-2
require("lua.variables")

hl.workspace_rule({ workspace = "1", monitor = Variables.monitors.primary, default = true, persistent = true})
hl.workspace_rule({ workspace = "2", monitor = Variables.monitors.primary, default = false, persistent = true})
hl.workspace_rule({ workspace = "3", monitor = Variables.monitors.primary, default = false, persistent = true})
hl.workspace_rule({ workspace = "4", monitor = Variables.monitors.primary, default = false, persistent = true})
hl.workspace_rule({ workspace = "5", monitor = Variables.monitors.primary, default = false, persistent = true})
hl.workspace_rule({ workspace = "6", monitor = Variables.monitors.secondary, default = true, persistent = true})
hl.workspace_rule({ workspace = "7", monitor = Variables.monitors.secondary, default = false, persistent = true})
hl.workspace_rule({ workspace = "8", monitor = Variables.monitors.secondary, default = false, persistent = true})
hl.workspace_rule({ workspace = "9", monitor = Variables.monitors.secondary, default = false, persistent = true})
hl.workspace_rule({ workspace = "10", monitor = Variables.monitors.secondary, default = false, persistent = true})
