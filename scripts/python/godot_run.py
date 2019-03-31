#!/usr/bin/env python3

import pyautogui
import subprocess

pyautogui.PAUSE = 0.3
pyautogui.FAILSAFE = True

subprocess.call("focus_godot")
pyautogui.press("f5")
