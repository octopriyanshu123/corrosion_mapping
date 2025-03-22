#include "ros/ros.h"
#include "std_srvs/Trigger.h"
#include <cstdlib>

bool shutdownCallback(std_srvs::Trigger::Request& req,
                      std_srvs::Trigger::Response& res)
{
    ROS_INFO("Shutdown request received.");

    
    int shutdown_result = std::system("sudo shutdown now -h");

    
    if (WIFEXITED(shutdown_result) && (WEXITSTATUS(shutdown_result) == 0)) {
        ROS_INFO("System is shutting down.");
        res.success = true;
        res.message = "System is shutting down.";
    } else {
        ROS_ERROR("Failed to shut down the system.");
        res.success = false;
        res.message = "Failed to shut down the system.";
    }

    return true;
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "shutdown_service");
    ros::NodeHandle nh;


    ros::ServiceServer service = nh.advertiseService("shutdown", shutdownCallback);
    ROS_INFO("Shutdown service ready.");

    ros::spin();

    return 0;
}
