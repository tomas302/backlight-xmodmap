#!/usr/bin/env
import subprocess
from pynput import keyboard

released = True
light = False

def on_press(key):
    global released, light
    if keyboard.Key.scroll_lock == key:
        if released:
            if light:
                subprocess.call(["xset", "-led"])
                light = False
            else:
                subprocess.call(["xset", "led"])
                light = True
            released = False

def on_release(key):
    global released
    if not released and keyboard.Key.scroll_lock == key:
        released = True


with keyboard.Listener(
        on_press=on_press,
        on_release=on_release) as listener:
    listener.join()
