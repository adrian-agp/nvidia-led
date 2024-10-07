#!/bin/bash
unset #WAYLAND_DISPLAY
# Función para configurar la intensidad del LED usando nvidia-settings
set_led_intensity() {
    local intensity=$1
    nvidia-settings -a "[gpu:0]/GPULogoBrightness=$intensity"
}

# Función para parpadeo rápido
blink_fast() {
    for (( j=0; j<3; j++ )); do  # Realiza 3 parpadeos
        set_led_intensity 100
        sleep 0.2
        set_led_intensity 50
        sleep 0.2
        set_led_intensity 10
        sleep 0.2
    done
}

# Función para efecto de fade in/out con intervalos de 5
fade_led() {
    local start_intensity=$1
    local end_intensity=$2
    local fade_time=$3
    local step_size=5  # Cambiado a pasos de 5
    local half_fade_time=$(echo "$fade_time / 2" | bc -l)  # Tiempo para la mitad del ciclo
    local sleep_time=$(echo "$half_fade_time / (($end_intensity - $start_intensity) / $step_size)" | bc -l)  # Tiempo entre cada paso

    echo "Modo: Fade in/out de $start_intensity a $end_intensity en $fade_time segundos, con pasos de $step_size."

    while true; do
        # Fade in (subir intensidad)
        for (( i=$start_intensity; i<=$end_intensity; i+=$step_size )); do
            set_led_intensity $i
            sleep $sleep_time
        done

        # Fade out (bajar intensidad)
        for (( i=$end_intensity; i>=$start_intensity; i-=$step_size )); do
            set_led_intensity $i
            sleep $sleep_time
        done

        # Realizar 3 parpadeos rápidos después del fade
        blink_fast
    done
}

# Manejo de argumentos
if [ "$#" -ne 3 ]; then
    echo "Uso: $0 <intensidad mínima> <intensidad máxima> <tiempo total en segundos>"
    exit 1
fi

start_intensity=$1
end_intensity=$2
fade_time=$3

if [[ $start_intensity -ge 0 && $start_intensity -le 100 ]] && \
   [[ $end_intensity -ge 0 && $end_intensity -le 100 ]] && \
   [[ $fade_time -gt 0 ]]; then
    fade_led $start_intensity $end_intensity $fade_time
else
    echo "Valores no válidos. Asegúrate de que las intensidades estén entre 0 y 100 y que el tiempo sea mayor que 0."
fi

