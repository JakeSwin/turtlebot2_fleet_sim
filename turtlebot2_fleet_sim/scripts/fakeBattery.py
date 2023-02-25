#!/usr/bin/python
import rospy
from sensor_msgs.msg import BatteryState

def fake_battery_publisher():
    pub = rospy.Publisher('fake_battery_state', BatteryState, queue_size=10)
    rospy.init_node('fake_battery_node')
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        battery_msg = BatteryState()
        battery_msg.voltage = 9.0
        battery_msg.percentage = 1.0
        battery_msg.power_supply_status = 4
        battery_msg.power_supply_health = 1
        battery_msg.power_supply_technology = 0
        battery_msg.present = True

        pub.publish(battery_msg)
        rate.sleep()

if __name__ == '__main__':
    try:
        rospy.loginfo("Starting fake battery publisher node")
        fake_battery_publisher()
    except rospy.ROSInterruptException:
        pass
