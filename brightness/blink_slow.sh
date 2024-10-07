#!/bin/bash

# Función para configurar la intensidad del LED usando nvidia-settings
set_led_intensity() {
    local intensity=$1
    nvidia-settings -a "[gpu:0]/GPULogoBrightness=$intensity"
}

# Función para crear efecto de parpadeo lento
blink_slow() {
    echo "Modo: Parpadeo lento"
    while true; do
        set_led_intensity 100
        sleep 1
        set_led_intensity 0
        sleep 1
    done
}

blink_slow

