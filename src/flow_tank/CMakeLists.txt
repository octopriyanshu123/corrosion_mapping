cmake_minimum_required(VERSION 2.8.3)
project(flow_tank)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
)

catkin_package(
  CATKIN_DEPENDS roscpp std_msgs
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)

add_executable(flow_value_subscriber src/main.cpp)

target_link_libraries(flow_value_subscriber
  ${catkin_LIBRARIES}
)

install(TARGETS flow_value_subscriber
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)