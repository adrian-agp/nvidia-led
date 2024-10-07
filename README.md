# nvidia-led

LEDs are funny. LEDs are irresistible. Everybody loves LEDs. Why do you think you got your gpu? For performance? Not! it's because you love LEDs :rotating_light:

Nvidia-led is equivalent to [GeForce Experience LED Visualizer](http://www.geforce.com/whats-new/guides/geforce-experience-nvidia-geforce-gtx-led-visualizer-user-guide#1) for GNU/Linux. Get awesome effects for NVIDIA GeForce GTX LED logo like this:

<p align="center"><a href="https://www.youtube.com/watch?v=vUR2Ul4HKUc"><img src="http://img.youtube.com/vi/5W5Rm8K-hcY/0.jpg" alt="Demo video" width="480" height="320" border="0"></a></p>

###Requirements

* Nvidia drivers >= [550](http://www.nvidia.com/download/driverResults.aspx/72250/en-us)
*  A Nvidia Geforce GTX GPU with LED logo (obvious!)

###Installation

#####From sources

Clone or download repository and install it traditionally:

    make
    sudo make install

### Usage

    $ nvidia-led
        Selecciona el modo de LED:
        1. Parpadeo rápido
        2. Parpadeo lento
        3. Intensidad fija
        4. Fade in/out
        5. Salir
Opción:
    
#####Examples:

    Opción: 4
    Ingresa la intensidad mínima (0-100): 2
    Ingresa la intensidad máxima (0-100): 60
    Ingresa el tiempo total del fade (subir y bajar) en segundos: 2

    ctrl+c detener el script y entrar al menu.
    
#####Effects

    1. Parpadeo rápido  No le e puesto elecccion de efecto de intencidad.
    2. Parpadeo lento   No le e puesto elecccion de efecto de intencidad.
    3. Intensidad fija  ya el nombre lo dice todo se mantienen los led prendidos.
    
Do you need more effects? Add your custom effects in `~/.config/nvidia-led/brightness`
