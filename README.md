# Example Dockerfile for Franka Emika Panda

TLDR: 
1. ```git submodule update --init --recursive``` (to update libfranka)
2. ```make``` (in root directory)
3. ```make nvidia``` (if you have an NVIDIA GPU)
4. ```./start.sh```
5. Run a basic simulation with Panda: ```roslaunch panda_moveit_config demo.launch``` (this will open an RVIZ window with the Panda)

## To use:

### Get Docker Running on Your Host
1. Make sure you have docker client (and daemon) installed on your host OS (see instructions at https://docs.docker.com/get-started/)
1. Check your docker daemon is running correctly. Running most basic docker client commands will verify this e.g.:
    ```bash
    docker image ls
    ```
1. If the above fails (typically on linux), you may need to restart your docker daemon:
    ```bash
    sudo service docker stop
    sudo service docker start
    ```

### Create docker image from the Dockerfile
1. Make sure you have nvidia drivers and the nvidia-cuda-toolkit installed or your container will try to use the inbuilt CPU graphics instead, and won't run properly. To install the toolkit:
    ```bash
    sudo apt-get install nvidia-cuda-toolkit
    ```
1. Install nvidia-docker by following the instructions at https://github.com/NVIDIA/nvidia-docker
1. Navigate to the folder you cloned this repo into.
1. From within this root directory:
    ```bash
    make
    ```
    If you are using an earlier Docker version than 19.03 AND want to use an NVIDIA GPU, also run the following after the previous make (if you don't have an NVIDIA GPU, SKIP THIS STEP):
    ```bash
    make nvidia
    ``` 
1. TODO: Add in any known issues
1. Note: Running `make` above should take approximately 20-30 minutes to generate with a decent GPU/CPU.

### Running the container
1. You have created a docker image above, and can now run it as a container
1. From within the root directory, run the below.
    TODO: Instructions on how to include flags to pass in the filepath on your host machine which includes your application specific code
    TODO: Add in instructions (port forwarding etc?) to allow connection to Fetch hardware
    ```bash
    ./start.sh
    ```
    (you should be able to open a new terminal and run ``start.sh`` as many times as you want to get multiple terminal windows inside the container)
1. If you get an error similar to ``could not select device driver “” with capabilities: [[gpu]]`` , make the following changes to the ``start.sh`` file. 
Comment out all lines starting from ``which nvidia-docker > /dev/null 2> /dev/null`` upto ``fi`` (before xhost +) but leave ``DOCKER_COMMAND=docker`` in. (TODO figure out why this happens)
