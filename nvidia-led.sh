#!/bin/bash
unset #WAYLAND_DISPLAY
# Función para manejar la salida del script y detener procesos secundarios
cleanup() {
    echo "Deteniendo todos los procesos de LED..."
    pkill -P $$  # Detiene todos los procesos secundarios
}

# Captura la señal de salida (Ctrl+C)
trap cleanup SIGINT SIGTERM

while true; do
    echo "Selecciona el modo de LED:"
    echo "1. Parpadeo rápido"
    echo "2. Parpadeo lento"
    echo "3. Intensidad fija"
    echo "4. Fade in/out"
    echo "5. Salir"
    read -p "Opción: " option

    case $option in
        1)
            /home/$USER/.config/nvidia-led/brightness/blink_fast.sh &
            pid=$!  # Guarda el PID del proceso
            wait $pid  # Espera a que el proceso termine
            ;;
        2)
            /home/$USER/.config/nvidia-led/brightness/blink_slow.sh &
            pid=$!
            wait $pid
            ;;
        3)
            read -p "Ingresa la intensidad (0-100): " intensity
            /home/$USER/.config/nvidia-led/static_led.sh $intensity
            ;;
        4)
            read -p "Ingresa la intensidad mínima (0-100): " start_intensity
            read -p "Ingresa la intensidad máxima (0-100): " end_intensity
            read -p "Ingresa el tiempo total del fade (subir y bajar) en segundos: " fade_time
            /home/$USER/.config/nvidia-led/brightness/fade_led.sh $start_intensity $end_intensity $fade_time &
            pid=$!
            wait $pid
            ;;
        5)
            cleanup  # Llama a la función de limpieza
            exit 0
            ;;
        *)
            echo "Opción no válida"
            ;;
    esac

    echo "Regresando al menú..."
done
