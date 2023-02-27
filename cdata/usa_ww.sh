#!/bin/bash

# ingest weather overview images from College of DuPage
# this should run on a cron every 5 minutes
# make sure output directories exist!

IMAGE_LOCATION_EXTERNAL="https://weather.cod.edu/cdata/satellite/regional/usa/current/usa.ww.gif"
IMAGE_LOCATION_OUTPUT="~/ContentDelivery/met/img/"

if [ -d $IMAGE_LOCATION_OUTPUT ]
then
  curl $IMAGE_LOCATION_EXTERNAL > $IMAGE_LOCATION_OUTPUT/overview.gif
  curl -o "${IMAGE_LOCATION_OUTPUT}/overview/overview_${EPOCHSECONDS}.gif" $IMAGE_LOCATION_EXTERNAL
else
  echo "CRITICAL: Out directory does not exist."
fi
