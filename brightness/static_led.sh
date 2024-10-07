#!/bin/bash

# Función para configurar la intensidad del LED usando nvidia-settings
set_led_intensity() {
    local intensity=$1
    nvidia-settings -a "[gpu:0]/GPULogoBrightness=$intensity"
}

# Lee la intensidad deseada del usuario
read -p "Ingresa la intensidad (0-100): " intensity
if [[ $intensity -ge 0 && $intensity -le 100 ]]; then
    echo "Modo: Intensidad fija"
    set_led_intensity $intensity
else
    echo "Intensidad no válida. Debe ser un valor entre 0 y 100."
fi

