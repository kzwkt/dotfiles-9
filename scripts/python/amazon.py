#!/usr/bin/env python3

import pyautogui

# pyautogui.PAUSE = 0.2
pyautogui.FAILSAFE = True

pyautogui.moveTo(34, 526)
pyautogui.click()

pos_y = 526

while pos_y >= 526 and pos_y <= 900:
    pyautogui.moveRel(0, 47)
    pyautogui.click()
    pos_y = pos_y + 47
