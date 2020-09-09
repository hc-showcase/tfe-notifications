#!/bin/bash

TOKEN='abc'
URL='tfe.msk.pub'
WORKSPACE='ws-FzMaNjmQxjb7W2Ve'

curl \
  --header "Authorization: Bearer $TOKEN" \
  --header "Content-Type: application/vnd.api+json" \
  --request POST \
  --data @create-notification-request-payload.json \
  https://$URL/api/v2/workspaces/$WORKSPACE/notification-configurations
