#!/usr/bin/env python3

import pyautogui
import subprocess

subprocess.call("tw_focus")
pyautogui.PAUSE = 0.1
pyautogui.FAILSAFE = True
pyautogui.hotkey("alt", "u")
