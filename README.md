# Train Entraining and Detraining Perception System

A computer vision-based system for detecting and analyzing train entraining and detraining scenarios using CoppeliaSim (V-REP) simulation environment, YOLO object detection, and robotic control.

## Overview

This project implements an intelligent perception system that can detect trains, train doors, and people in a simulated environment to analyze entraining and detraining scenarios. The system uses:
- YOLO v4 for object detection
- CoppeliaSim (formerly V-REP) for robotics simulation
- Python for computer vision processing
- MATLAB for robot control and movement coordination

## Features

- Real-time object detection of trains, train doors, and people
- Vision sensor integration with CoppeliaSim simulation
- Robot movement control and coordination
- Integrated simulation environment
- Multi-platform support (Windows/Linux)

## Prerequisites

- Python 3.8 or higher
- MATLAB
- CoppeliaSim (V-REP) Simulator
- Required Python packages:
  - OpenCV (`cv2`)
  - NumPy
- YOLO v4 weights and configuration files (included)

## Installation

1. Clone this repository:
```bash
git clone https://github.com/aadhibest/perception_entrain_detrain.git
cd perception_entrain_detrain
```

2. Set up CoppeliaSim:
   - Download and install CoppeliaSim from the [official website](https://www.coppeliarobotics.com/downloads)
   - Load the simulation scene: `Final Simulation.ttt`

3. Verify the required files are present:
   - Python programs directory:
     - `yolov4-obj_best.weights`
     - `yolov4-obj.cfg`
     - Other Python scripts
   - MATLAB programs directory:
     - Required MATLAB files and DLLs

## Usage

1. Start CoppeliaSim and load `Final Simulation.ttt`

2. Run the main Python script:
```bash
cd "Python programs"
python Main.py
```

3. For robot control, run the MATLAB program:
```matlab
cd "Matlab programs"
run Entrain.m
```

The system will start detecting objects in the simulation environment and coordinate robot movements based on the detection results.


## How It Works

1. The system initializes a connection to CoppeliaSim through the remote API
2. Vision sensors in the simulation capture the scene
3. YOLO object detection identifies trains, doors, and people
4. MATLAB scripts control robot movements based on detection results
5. The system continuously monitors and responds to the environment

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.


## Author

- [Aadhithya Krishnakumar](https://github.com/aadhibest/)
- [Navneeth Krishna](https://github.com/Navneeth-Krishna/)

## Acknowledgments

- YOLO v4 team for the object detection framework
- CoppeliaSim (V-REP) for the robotics simulation environment
