import Data.Ratio
import XMonad
import XMonad.Actions.CycleWS (shiftTo)
import XMonad.Actions.WindowGo (runOrRaise)
import XMonad.Actions.Workscreen (shiftToWorkscreen)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (ewmh, ewmhFullscreen)
import XMonad.Hooks.ManageDocks (ToggleStruts (ToggleStruts), avoidStruts, docks)
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar (StatusBarConfig, statusBarProp, withSB)
import XMonad.Hooks.StatusBar.PP (xmobarColor, xmobarFont)
import XMonad.Layout.NoBorders (noBorders, smartBorders)
import XMonad.Layout.Spacing (spacingWithEdge)
import XMonad.StackSet (RationalRect (..))
import XMonad.Util.ClickableWorkspaces (clickablePP)
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Ungrab (unGrab)

main :: IO ()
main = xmonad . ewmh . ewmhFullscreen . withSB (myXmobarProp 0) . withSB (myXmobarProp 1) . docks $ myConfig

myXmobarProp :: Int -> StatusBarConfig
myXmobarProp monitorNr = statusBarProp xmobarCommand $ clickablePP myXmobarPP
  where
    xmobarCommand = "xmobar -x " ++ show monitorNr

myConfig =
  def
    { modMask = mod4Mask,
      terminal = myTerminal,
      startupHook = myStartup,
      borderWidth = 2,
      normalBorderColor = "#363a4f",
      focusedBorderColor = "#f5bde6",
      workspaces = [workspaceCode, workspaceWeb, workspaceDiscord, workspaceSpotify, workspaceGaming],
      layoutHook = avoidStruts (tiledLayout ||| fullLayout),
      manageHook = composeOne [isDialog -?> dialogLayout] >> composeAll assignedWorkspaces
    }
    `additionalKeysP` [ ("M-<Return>", spawn myTerminal),
                        ("M-q", kill),
                        ("M-p", spawn "rofi -show drun"),
                        ("M-f", spawn "thunar"),
                        ("M-b", runOrRaise "firefox" (className =? "firefox")),
                        ("M-S-b", spawn "firefox"),
                        ("M-r", spawn "killall xmobar; xmonad --recompile; xmonad --restart"),
                        ("M-s", unGrab *> spawn "~/.luna/scripts/take-screenshot.sh -full"),
                        ("M-S-s", unGrab *> spawn "~/.luna/scripts/take-screenshot.sh -rect"),
                        ("M-x", sendMessage ToggleStruts)
                      ]
  where
    myTerminal = "alacritty"
    myStartup = spawn "xsetroot -cursor_name left_ptr"

    tiledLayout = spacingWithEdge 8 $ smartBorders $ Tall 1 (3 / 100) (1 / 2)
    fullLayout = noBorders Full
    dialogLayout = doRectFloat $ RationalRect (1 % 4) (1 % 4) (1 % 2) (1 % 2)

    workspaceCode = "\xeac4"
    workspaceSpotify = "\xf1bc"
    workspaceWeb = "\xf059f"
    workspaceDiscord = "\xf066f"
    workspaceGaming = "\xf11b"
    assignedWorkspaces =
      [ className =? "firefox" --> doShift workspaceWeb,
        className =? "Spotify" --> doShift workspaceSpotify,
        className =? "discord" --> doShift workspaceDiscord,
        className =? "steam" --> doShift workspaceGaming
      ]

myXmobarPP =
  def
    { ppSep = "   ",
      ppWsSep = "   ",
      ppTitleSanitize = xmobarStrip,
      ppCurrent = biggerFont . focusedColor,
      ppVisible = biggerFont . normalColor,
      ppHiddenNoWindows = biggerFont . normalColor,
      ppHidden = biggerFont . normalColor,
      ppOrder = \(workspaces : _ : title : _) -> [workspaces, title]
    }
  where
    biggerFont = xmobarFont 1
    focusedColor = xmobarColor "#ed8796" ""
    normalColor = xmobarColor "#cad3f5" ""
