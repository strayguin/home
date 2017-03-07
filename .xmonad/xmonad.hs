import XMonad
import XMonad.Layout.Grid
import XMonad.ManageHook
import XMonad.Prompt
import XMonad.Prompt.Shell(shellPrompt)
import XMonad.Util.EZConfig(additionalKeysP)

main = xmonad $ defaultConfig
	{ borderWidth = 2
	, focusedBorderColor = "#dddddd"
	, layoutHook = Grid
	, manageHook = composeAll
		[ className =? "VirtualBox"--> doFloat
		]
	, modMask = mod4Mask
	, normalBorderColor = "#000000"
	, terminal = "urxvt"
	}
	`additionalKeysP`
	[ ("M-b", spawn "chromium")
	, ("M-r", shellPrompt defaultXPConfig)
	, ("M-S-l", spawn "xscreensaver-command --lock")
	, ("M-S-r", spawn "xmonad --recompile && xmonad --restart")
	, ("<XF86AudioRaiseVolume>", spawn "amixer sset Master 3%+")
	, ("<XF86AudioLowerVolume>", spawn "amixer sset Master 3%-")
	, ("<XF86AudioMute>",        spawn "amixer sset Master toggle")
	, ("<XF86MonBrightnessUp>",   spawn "sudo backlight +")
	, ("<XF86MonBrightnessDown>", spawn "sudo backlight -")
	]