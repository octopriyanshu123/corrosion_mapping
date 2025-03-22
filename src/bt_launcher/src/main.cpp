#include <ros/ros.h>
#include <std_srvs/Trigger.h>

bool executeScript(std_srvs::Trigger::Request &req, std_srvs::Trigger::Response &res)
{
    int result = system("bash ~/catkin_ws/src/bt_launcher/control_logic.sh &");

    if (result == 0) {
        res.success = true;
        res.message = "Script launched successfully";
    } else {
        res.success = false;
        res.message = "Failed to launch script";
    }

    return true;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "script_launcher_node");
    ros::NodeHandle nh;

    ros::ServiceServer service = nh.advertiseService("launch_script", executeScript);

    ROS_INFO("Ready to launch script on service call.");

    ros::spin();

    return 0;
}