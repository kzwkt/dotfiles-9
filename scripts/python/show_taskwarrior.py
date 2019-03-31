#!/usr/bin/env python3

import pyautogui
import subprocess

# pyautogui.PAUSE = 0.1
pyautogui.FAILSAFE = True

subprocess.call("tw_focus")
pyautogui.hotkey("alt", "u")
