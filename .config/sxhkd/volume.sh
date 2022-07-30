#!/bin/bash

pactl set-sink-volume $(pactl info | awk '/^Default Sink/ { print $3 }') $1
