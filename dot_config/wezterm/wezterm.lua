local wezterm = require 'wezterm'
local config  = wezterm.config_builder()

config = {
    color_scheme                         = 'Catppuccin Latte',
    font                                 = wezterm.font 'FiraCode Nerd Font Mono',
    font_size                            = 12,
    cell_width                           = 0.9,
    freetype_load_target                 = "Light", -- Not sure if this has an effect
    default_cursor_style                 = 'BlinkingUnderline',
    cursor_thickness                     = 3,
    cursor_blink_ease_in                 = 'Constant',
    cursor_blink_ease_out                = 'Constant',
    native_macos_fullscreen_mode         = true,
    use_resize_increments                = true,
    hide_tab_bar_if_only_one_tab         = true,
    tab_bar_at_bottom                    = true,
    use_fancy_tab_bar                    = false,
    tab_and_split_indices_are_zero_based = true
}

local function get_appearance()
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return 'Dark'
end

config.colors = {}

if get_appearance():find "Dark" then
    config.color_scheme      = "Catppuccin Mocha"
else
    config.color_scheme      = "Catppuccin Latte"
    config.colors.background = 'white'
    config.colors.foreground = 'black'
    config.inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.95
    }
end

config.leader = { key = "q", mods = "ALT", timeout_milliseconds = 2000 }

config.keys = {
    {
        key    = 'Enter',
        mods   = 'SUPER',
        action = wezterm.action.ToggleFullScreen
    },
    {
        key    = 'Enter',
        mods   = 'ALT',
        action = wezterm.action.DisableDefaultAssignment
    },
    {
        mods   = "LEADER",
        key    = "c",
        action = wezterm.action.SpawnTab "CurrentPaneDomain",
    },
    {
        mods   = "LEADER",
        key    = "x",
        action = wezterm.action.CloseCurrentPane { confirm = true }
    },
    {
        mods   = "LEADER",
        key    = "b",
        action = wezterm.action.ActivateTabRelative(-1)
    },
    {
        mods   = "LEADER",
        key    = "n",
        action = wezterm.action.ActivateTabRelative(1)
    },
    {
        mods   = "LEADER",
        key    = "|",
        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
    },
    {
        mods   = "LEADER",
        key    = "-",
        action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
    },
    {
        mods   = "LEADER",
        key    = "h",
        action = wezterm.action.ActivatePaneDirection "Left"
    },
    {
        mods   = "LEADER",
        key    = "j",
        action = wezterm.action.ActivatePaneDirection "Down"
    },
    {
        mods   = "LEADER",
        key    = "k",
        action = wezterm.action.ActivatePaneDirection "Up"
    },
    {
        mods   = "LEADER",
        key    = "l",
        action = wezterm.action.ActivatePaneDirection "Right"
    },
    {
        mods   = "LEADER",
        key    = "LeftArrow",
        action = wezterm.action.AdjustPaneSize { "Left", 5 }
    },
    {
        mods   = "LEADER",
        key    = "RightArrow",
        action = wezterm.action.AdjustPaneSize { "Right", 5 }
    },
    {
        mods   = "LEADER",
        key    = "DownArrow",
        action = wezterm.action.AdjustPaneSize { "Down", 5 }
    },
    {
        mods   = "LEADER",
        key    = "UpArrow",
        action = wezterm.action.AdjustPaneSize { "Up", 5 }
    },
    {
        mods = 'LEADER',
        key = ',',
        action = wezterm.action.PromptInputLine {
            description = 'Enter new name for tab',
            action = wezterm.action_callback(
                function(window, _, name)
                    if name then
                        window:active_tab():set_title(name)
                    end
                end
            )
        }
    }
}

for i = 0, 9 do
    table.insert(config.keys, {
        key    = tostring(i),
        mods   = "LEADER",
        action = wezterm.action.ActivateTab(i),
    })
end

config.mouse_bindings = {
    {
        event  = { Up = { streak = 1, button = 'Left' } },
        mods   = 'SUPER',
        action = wezterm.action.OpenLinkAtMouseCursor
    },
    {
        event  = { Up = { streak = 1, button = 'Left' } },
        mods   = 'NONE',
        action = wezterm.action.CompleteSelection 'Clipboard'
    }
}

return config
