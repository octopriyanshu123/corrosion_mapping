#include <ros/ros.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Int8.h>
#include <std_srvs/Trigger.h>
#include <std_srvs/SetBool.h>
#include <std_msgs/Float32.h> 
#include <behaviortree_cpp_v3/bt_factory.h>
#include <behaviortree_cpp_v3/behavior_tree.h>
#include <behaviortree_cpp_v3/action_node.h>
#include <geometry_msgs/PoseStamped.h>

#include <signal.h>
#include <thread>
#include <chrono>
#include <iostream>
#include <cstdlib>

int forward_distance = 0;
float position_x = 0.0;
float position_y = 0.0;
ros::Publisher pub1;
ros::ServiceClient ser2 ;
float miny = 0;
float maxy = 0;
float globaly = 0;


void positionCallback(const geometry_msgs::PoseStampedConstPtr& msg){
     position_x = (msg->pose.position.x)*1000;
     position_y = (msg->pose.position.y)*1000;
     std_msgs::Int32 position_y_msg;
     position_y_msg.data = position_y;

     miny = std::min(miny , position_y);
     maxy = std::max(maxy , position_y);



     pub1.publish(position_y_msg);
    ROS_INFO("min position_y %f" , miny);
    ROS_INFO("max position_y %f" , maxy);
    sleep(1);
}


void probDiaCallback(const std_msgs::Int32ConstPtr& msg){
    forward_distance = msg->data;
    //ROS_INFO("Forward Distance %d" ,forward_distance);
}


void working(){

    ROS_INFO("position_x %f" , position_x);
    ROS_INFO("position_y %f" , position_y);
    ROS_INFO("Forward Distance %d" ,forward_distance);
    ROS_INFO("globaly Forward Distance %f" ,globaly);
    std_srvs::Trigger b;
    ser2.call(b);
    globaly +=forward_distance;

    miny += globaly;
    maxy += globaly;
    




}

bool lidar_raster_scan_callback(std_srvs::TriggerRequest &req, std_srvs::TriggerResponse &res ){
    working();
    res.success = true;
    res.message = "Lidar started";
}


int main(int argc, char **argv){
  ros::init(argc, argv, "lidar_raster_scan");
  ros::NodeHandle nh;
  pub1 = nh.advertise<std_msgs::Int32>("/y",10);
  ros::Subscriber sub1 = nh.subscribe("/position_yaw", 1,positionCallback);
  ros::Subscriber sub2 = nh.subscribe("/set_joint_angle_value", 1,probDiaCallback);
  ros::ServiceServer ser1  = nh.advertiseService("/lidar_raster_scan", lidar_raster_scan_callback);
   ser2 = nh.serviceClient<std_srvs::Trigger>("/set_joint_angle");
  ros::spin();
    return 0;
}

