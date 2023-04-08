FROM osrf/ros:melodic-desktop-full

RUN apt update
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt update
RUN apt install -y maven terminator tmux openjdk-11-jdk

RUN bash -c "source /opt/ros/melodic/setup.bash"
WORKDIR /turtlebot_ws
COPY ./src ./src
RUN rosdep update
RUN bash -c "rosdep install --from-paths src --ignore-src -r -y"
RUN bash -c ". /opt/ros/melodic/setup.bash; catkin_make_isolated"
