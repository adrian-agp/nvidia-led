#!/bin/bash

# Función para configurar la intensidad del LED usando nvidia-settings
set_led_intensity() {
    local intensity=$1
    nvidia-settings -a "[gpu:0]/GPULogoBrightness=$intensity"
}

# Función para crear efecto de parpadeo rápido
blink_fast() {
    echo "Modo: Parpadeo rápido"
    while true; do
        set_led_intensity 100
        sleep 0.2
        set_led_intensity 0
        sleep 0.2
    done
}

blink_fast

