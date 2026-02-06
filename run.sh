#!/bin/bash

COMPONENT=$1

if [ -z "$COMPONENT" ]; then
  echo "Usage: ./run.sh <frontend|mongodb|catalogue|user|cart|shipping|payment|redis|mysql|rabbitmq>"
  exit 1
fi

PLAYBOOK="playbooks/roboshop.yml"

echo "🚀 Deploying component: $COMPONENT"

ansible-playbook \
  -i inventory \
  "$PLAYBOOK" \
  -e "component=$COMPONENT target_hosts=$COMPONENT" \
  --ask-pass
