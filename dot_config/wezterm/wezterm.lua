local wezterm = require 'wezterm'
local config  = wezterm.config_builder()
local act     = wezterm.action

config = {
    color_scheme                               = 'Catppuccin Latte',
    font                                       = wezterm.font 'FiraCode Nerd Font Mono',
    font_size                                  = 12,
    cell_width                                 = 0.9,
    freetype_load_target                       = 'Light', -- Not sure if this has an effect
    default_cursor_style                       = 'BlinkingUnderline',
    cursor_thickness                           = 3,
    cursor_blink_ease_in                       = 'Constant',
    cursor_blink_ease_out                      = 'Constant',
    native_macos_fullscreen_mode               = true,
    use_resize_increments                      = true,
    hide_tab_bar_if_only_one_tab               = true,
    tab_bar_at_bottom                          = true,
    use_fancy_tab_bar                          = false,
    tab_and_split_indices_are_zero_based       = true,
    switch_to_last_active_tab_when_closing_tab = true
}

local function get_appearance()
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return 'Dark'
end

config.colors = {}

if get_appearance():find 'Dark' then
    config.color_scheme      = 'Catppuccin Mocha'
else
    config.color_scheme      = 'Catppuccin Latte'
    config.colors.background = 'white'
    config.colors.foreground = 'black'
    config.inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.95
    }
end

config.leader = { key = 'q', mods = 'ALT', timeout_milliseconds = 2000 }

config.keys = {
    {
        key    = 'Enter',
        mods   = 'SUPER',
        action = act.ToggleFullScreen
    },
    {
        key    = 'Enter',
        mods   = 'ALT',
        action = act.DisableDefaultAssignment
    },
    {
        mods   = 'LEADER',
        key    = 'c',
        action = act.SpawnTab 'CurrentPaneDomain'
    },
    {
        mods   = 'LEADER',
        key    = 'x',
        action = act.CloseCurrentPane { confirm = true }
    },
    {
        mods   = 'LEADER',
        key    = 'b',
        action = act.ActivateTabRelative(-1)
    },
    {
        mods   = 'LEADER',
        key    = 'n',
        action = act.ActivateTabRelative(1)
    },
    {
        mods   = 'LEADER',
        key    = 'w',
        action = act.ShowTabNavigator
    },
    {
        mods   = 'LEADER',
        key    = '|',
        action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
    },
    {
        mods   = 'LEADER',
        key    = '-',
        action = act.SplitVertical { domain = 'CurrentPaneDomain' }
    },
    {
        mods   = 'LEADER',
        key    = 'h',
        action = act.ActivatePaneDirection 'Left'
    },
    {
        mods   = 'LEADER',
        key    = 'j',
        action = act.ActivatePaneDirection 'Down'
    },
    {
        mods   = 'LEADER',
        key    = 'k',
        action = act.ActivatePaneDirection 'Up'
    },
    {
        mods   = 'LEADER',
        key    = 'l',
        action = act.ActivatePaneDirection 'Right'
    },
    {
        mods   = 'LEADER',
        key    = 'LeftArrow',
        action = act.AdjustPaneSize { 'Left', 5 }
    },
    {
        mods   = 'LEADER',
        key    = 'RightArrow',
        action = act.AdjustPaneSize { 'Right', 5 }
    },
    {
        mods   = 'LEADER',
        key    = 'DownArrow',
        action = act.AdjustPaneSize { 'Down', 5 }
    },
    {
        mods   = 'LEADER',
        key    = 'UpArrow',
        action = act.AdjustPaneSize { 'Up', 5 }
    },
    {
        mods   = 'LEADER',
        key    = 'z',
        action = wezterm.action.TogglePaneZoomState
    },
    {
        mods   = 'LEADER',
        key    = ',',
        action = act.PromptInputLine {
            description = 'Enter new name for tab',
            action      = wezterm.action_callback(
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
        mods   = 'LEADER',
        action = act.ActivateTab(i)
    })
end

config.mouse_bindings = {
    {
        event  = { Up = { streak = 1, button = 'Left' } },
        mods   = 'SUPER',
        action = act.OpenLinkAtMouseCursor
    },
    {
        event  = { Up = { streak = 1, button = 'Left' } },
        mods   = 'NONE',
        action = act.CompleteSelection 'Clipboard'
    }
}

return config
