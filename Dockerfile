FROM osrf/ros:melodic-desktop-full

RUN apt update
RUN apt install -y maven terminator tmux

RUN /bin/bash -c "source /opt/ros/melodic/setup.bash"
WORKDIR /turtlebot_ws
COPY ../ .
RUN rosdep update
RUN /bin/bash -c "rosdep install --from-paths src --ignore-src -r -y"
