#!/usr/bin/env python
# -*- coding: utf-8 -*-
import paho.mqtt.client as mqtt
import re
import json


#
def on_connect(client, userdata, flags, rc):
	# print("Connected with result code "+str(rc))
    uuid = "v1/devices/bba23000-c442-4c17-a5be-b2de1b5b4eb6"
    arrId = ["aa0", "aa1", "aa2", "aa3", "aa4", "aa5", "aa6", "aa7", "aa8", "a90", "a91", "a92", "a93", "a94", "a95", "a96", "a97", "a98", "a99"]
    for i in arrId:
        client.subscribe(topic="v1/devices/bba23"+i+"-c442-4c17-a5be-b2de1b5b4eb6")


# メッセージ受け取り
def on_message(client, userdata, msg):
    mqtt_topic = msg.topic
    mqtt_message = str(msg.payload)
    print("Topic: " + msg.topic+" ,Message: "+str(msg.payload))
    json_message = json.loads(mqtt_message)
    if json_message["occupancy"] == True:
        print ("Hit device : "+ mqtt_topic[16: 19])
        client.disconnect()




if __name__ == "__main__":
#client = mqtt.Client()
    host = "mqtt.gogravity.io"
    port = 1883
    username = "an-eval2-trackers"
    password = "Xq40S0ExPo"

    client = mqtt.Client()
    client.on_connect = on_connect
    client.on_message = on_message
    client.username_pw_set(username, password=password)

    client.connect(host,port=port,keepalive=60)
    client.loop_forever()
