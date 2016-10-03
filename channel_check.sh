#!/bin/bash

set -e

# Check for token environment variable
if [ -z ${SLACK_TOKEN+x} ]; then echo "SLACK_TOKEN is unset" >&2; exit 1;  fi

# Check for parameter
if [ "$#" -ne 1 ]
then
  echo "Usage: channel_check [channel_id]"
  exit 1
fi

# Make API request
req="https://slack.com/api/channels.info?token=${SLACK_TOKEN}&channel=${1}"
res=$(curl -s ${req} | jq '.channel.unread_count')

echo $res
