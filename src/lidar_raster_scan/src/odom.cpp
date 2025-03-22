#include <ros/ros.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Int16.h>

#include <std_msgs/Int8.h>
#include <std_srvs/Trigger.h>
#include <std_srvs/SetBool.h>
#include <std_msgs/Float32.h> 
#include <behaviortree_cpp_v3/bt_factory.h>
#include <behaviortree_cpp_v3/behavior_tree.h>
#include <behaviortree_cpp_v3/action_node.h>
#include <signal.h>
#include <thread>
#include <chrono>
#include <iostream>
#include <cstdlib>
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>
#include <tf/transform_broadcaster.h>



float linearx = 0.0;
float angularw = 0.0;
float speed = 0.0;
float theta_ = 0.0;
  double x = 0.0;
  double y = 0.0;
  double th = 0.0;

  double vx = 0.1;
  double vy = -0.1;
  double vth = 0.1;
ros::Publisher odom_pub;
  ros::Time current_time, last_time;

// tf::TransformBroadcaster odom_broadcaster;

  // ros::Rate r(1.0);




void cmd_vel_topic_Callback(const geometry_msgs::Twist &msg){
  linearx = msg.linear.x;
  angularw = msg.angular.z;

  

}


void motor_speed_Callback(const std_msgs::Int16::ConstPtr &msg){
  speed = msg->data;
  
}

void get_odometer(const ros::TimerEvent &){
// ROS_INFO("Linear x %f" ,linearx);
// ROS_INFO("Angular Z %f" , angularw);
// ROS_INFO("Speed %f" , speed);
  current_time = ros::Time::now();
  //last_time = ros::Time::now();

    //compute odometry in a typical way given the velocities of the robot
    double dt = (current_time - last_time).toSec();
    // double delta_x = (vx * cos(th) - vy * sin(th)) * dt;
    // double delta_y = (vx * sin(th) + vy * cos(th)) * dt;
    // double delta_th = vth * dt;

   // x += delta_x;
    x += (linearx*speed) ;
    y += (linearx*speed) ;
    //y += delta_y;
    th += angularw * dt;

    //since all odometry is 6DOF we'll need a quaternion created from yaw
     geometry_msgs::Quaternion odom_quat = tf::createQuaternionMsgFromYaw(th);

    //first, we'll publish the transform over tf
    // geometry_msgs::TransformStamped odom_trans;
    // odom_trans.header.stamp = current_time;
    // odom_trans.header.frame_id = "odom";
    // odom_trans.child_frame_id = "base_link";

    // odom_trans.transform.translation.x = x;
    // odom_trans.transform.translation.y = y;
    // odom_trans.transform.translation.z = 0.0;
    // odom_trans.transform.rotation = odom_quat;

    //send the transform
    // odom_broadcaster.sendTransform(odom_trans);

    //next, we'll publish the odometry message over ROS
    nav_msgs::Odometry odom;
    odom.header.stamp = current_time;
    odom.header.frame_id = "odom";

    //set the position
    odom.pose.pose.position.x = x;
    odom.pose.pose.position.y = y;
    odom.pose.pose.position.z = 0.0;
    odom.pose.pose.orientation = odom_quat;

    // //set the velocity
    // odom.child_frame_id = "base_link";
    // odom.twist.twist.linear.x = vx;
    // odom.twist.twist.linear.y = vy;
    // odom.twist.twist.angular.z = vth;

    odom_pub.publish(odom);
    last_time = current_time;
 

}




int main(int argc, char **argv){
  ros::init(argc, argv, "cmd_vel_speed_odom");
  ros::NodeHandle nh;
  ros::Subscriber cmd_vel_topic = nh.subscribe("/skid_steer/cmd_vel", 1,cmd_vel_topic_Callback);
  ros::Subscriber motor_speed_topic = nh.subscribe("/motor_speed", 1,motor_speed_Callback);
 odom_pub = nh.advertise<nav_msgs::Odometry>("/odom",10);
 ros::Timer odometer_timer_  = nh.createTimer(ros::Duration(0.1), get_odometer);
  ros::spin();
    return 0;
}

