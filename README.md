# Example Dockerfile for Franka Emika Panda

1. git submodule update --init --recursive (to update libfranka)
2. ```make``` (in root directory)
3. make nvidia (if you have an NVIDIA GPU)
4. ./start.sh
5. Run a basic simulation with Panda: roslaunch panda_moveit_config demo.launch (this will open an RVIZ window with the Panda)