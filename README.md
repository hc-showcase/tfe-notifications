# Shows the TFE Notifications API

## Pre-requisites
* AWS Account
* An endpoint that should be triggered by TFE. You can create one for testing purposes at [RequestBin](https://requestbin.com/?gclid=EAIaIQobChMIy7Lqqcfb6wIVCdZ3Ch38wgr-EAAYASAAEgKu7vD_BwE)
* Access to TFE or TFC and a user token

## Create the notification configuration
Prepare the request payload:
```
mkaesz@arch ~/w/tfe-notifactions> cat create-notification-request-payload.json 
{
  "data": {
    "type": "notification-configurations",
    "attributes": {
      "destination-type": "generic",
      "enabled": true,
      "name": "Webhook server test",
      "url": "https://75352b579e4bbb426ae02e833024f277.m.pipedream.net",
      "triggers": [
        "run:applying",
        "run:completed",
        "run:created",
        "run:errored",
        "run:needs_attention",
        "run:planning"
      ]
    }
  }
}

Set the url and the triggers accordingly.
```

Execute the following to create a notification configuration. Set the TOKEN, WORKSPACE and the TFE/TFE URL variable accordingly.

```./create-notification.sh```

## These are some examples of the payload that gets pushed to the Webhook endpoint

### After creating the notification configuration:

```
{
  "method": "POST",
  "path": "/",
  "query": {},
  "headers": {
    "x-forwarded-for": "35.198.178.114",
    "x-forwarded-proto": "https",
    "x-forwarded-port": "443",
    "host": "75352b579e4bbb426ae02e833024f277.m.pipedream.net",
    "x-amzn-trace-id": "Root=1-5f5886c8-84afa9e3cfd2697da8c31084",
    "content-length": "389",
    "accept": "application/json",
    "accept-encoding": "gzip, deflate",
    "user-agent": "TFE/1.0 (+https://app.terraform.io; TFE)",
    "content-type": "application/json",
    "x-tfe-notification-signature": ""
  },
  "bodyRaw": "{\"payload_version\":1,\"notification_configuration_id\":\"nc-ygBmbbQWJZAWMse7\",\"run_url\":null,\"run_id\":null,\"run_message\":null,\"run_created_at\":null,\"run_created_by\":null,\"workspace_id\":null,\"workspace_name\":null,\"organization_name\":null,\"notifications\":[{\"message\":\"Verification of Webhook server test\",\"trigger\":\"verification\",\"run_status\":null,\"run_updated_at\":null,\"run_updated_by\":null}]}",
  "body": {
    "payload_version": 1,
    "notification_configuration_id": "nc-ygBmbbQWJZAWMse7",
    "notifications": [
      {
        "message": "Verification of Webhook server test",
        "trigger": "verification"
      }
    ]
  }
}
```

### Trigger: "run:created"
```
{
  "method": "POST",
  "path": "/",
  "query": {},
  "headers": {
    "x-forwarded-for": "35.198.178.114",
    "x-forwarded-proto": "https",
    "x-forwarded-port": "443",
    "host": "75352b579e4bbb426ae02e833024f277.m.pipedream.net",
    "x-amzn-trace-id": "Root=1-5f5886df-05ee9376d3d6f976781ac450",
    "content-length": "572",
    "accept": "application/json",
    "accept-encoding": "gzip, deflate",
    "user-agent": "TFE/1.0 (+https://app.terraform.io; TFE)",
    "content-type": "application/json",
    "x-tfe-notification-signature": ""
  },
  "bodyRaw": "{\"payload_version\":1,\"notification_configuration_id\":\"nc-ygBmbbQWJZAWMse7\",\"run_url\":\"https://tfe.msk.pub/app/org1/tf-aws-simple/runs/run-vnWnJSpBcUFUTaVJ\",\"run_id\":\"run-vnWnJSpBcUFUTaVJ\",\"run_message\":\"Queued manually in Terraform Enterprise\",\"run_created_at\":\"2020-09-09T07:40:15.000Z\",\"run_created_by\":\"mkaesz\",\"workspace_id\":\"ws-FzMaNjmQxjb7W2Ve\",\"workspace_name\":\"tf-aws-simple\",\"organization_name\":\"org1\",\"notifications\":[{\"message\":\"Run Created\",\"trigger\":\"run:created\",\"run_status\":\"pending\",\"run_updated_at\":\"2020-09-09T07:40:15.000Z\",\"run_updated_by\":\"mkaesz\"}]}",
  "body": {
    "payload_version": 1,
    "notification_configuration_id": "nc-ygBmbbQWJZAWMse7",
    "run_url": "https://tfe.msk.pub/app/org1/tf-aws-simple/runs/run-vnWnJSpBcUFUTaVJ",
    "run_id": "run-vnWnJSpBcUFUTaVJ",
    "run_message": "Queued manually in Terraform Enterprise",
    "run_created_at": "2020-09-09T07:40:15.000Z",
    "run_created_by": "mkaesz",
    "workspace_id": "ws-FzMaNjmQxjb7W2Ve",
    "workspace_name": "tf-aws-simple",
    "organization_name": "org1",
    "notifications": [
      {
        "message": "Run Created",
        "trigger": "run:created",
        "run_status": "pending",
        "run_updated_at": "2020-09-09T07:40:15.000Z",
        "run_updated_by": "mkaesz"
      }
    ]
  }
}
```

### Trigger: "run:planning"
```
{
  "method": "POST",
  "path": "/",
  "query": {},
  "headers": {
    "x-forwarded-for": "35.198.178.114",
    "x-forwarded-proto": "https",
    "x-forwarded-port": "443",
    "host": "75352b579e4bbb426ae02e833024f277.m.pipedream.net",
    "x-amzn-trace-id": "Root=1-5f5886e1-c0633c600f1c9f106bfc3340",
    "content-length": "571",
    "accept": "application/json",
    "accept-encoding": "gzip, deflate",
    "user-agent": "TFE/1.0 (+https://app.terraform.io; TFE)",
    "content-type": "application/json",
    "x-tfe-notification-signature": ""
  },
  "bodyRaw": "{\"payload_version\":1,\"notification_configuration_id\":\"nc-ygBmbbQWJZAWMse7\",\"run_url\":\"https://tfe.msk.pub/app/org1/tf-aws-simple/runs/run-vnWnJSpBcUFUTaVJ\",\"run_id\":\"run-vnWnJSpBcUFUTaVJ\",\"run_message\":\"Queued manually in Terraform Enterprise\",\"run_created_at\":\"2020-09-09T07:40:15.000Z\",\"run_created_by\":\"mkaesz\",\"workspace_id\":\"ws-FzMaNjmQxjb7W2Ve\",\"workspace_name\":\"tf-aws-simple\",\"organization_name\":\"org1\",\"notifications\":[{\"message\":\"Run Planning\",\"trigger\":\"run:planning\",\"run_status\":\"planning\",\"run_updated_at\":\"2020-09-09T07:40:17.000Z\",\"run_updated_by\":null}]}",
  "body": {
    "payload_version": 1,
    "notification_configuration_id": "nc-ygBmbbQWJZAWMse7",
    "run_url": "https://tfe.msk.pub/app/org1/tf-aws-simple/runs/run-vnWnJSpBcUFUTaVJ",
    "run_id": "run-vnWnJSpBcUFUTaVJ",
    "run_message": "Queued manually in Terraform Enterprise",
    "run_created_at": "2020-09-09T07:40:15.000Z",
    "run_created_by": "mkaesz",
    "workspace_id": "ws-FzMaNjmQxjb7W2Ve",
    "workspace_name": "tf-aws-simple",
    "organization_name": "org1",
    "notifications": [
      {
        "message": "Run Planning",
        "trigger": "run:planning",
        "run_status": "planning",
        "run_updated_at": "2020-09-09T07:40:17.000Z"
      }
    ]
  }
}
```

### Trigger: "run:completed"
```
{
  "method": "POST",
  "path": "/",
  "query": {},
  "headers": {
    "x-forwarded-for": "35.198.178.114",
    "x-forwarded-proto": "https",
    "x-forwarded-port": "443",
    "host": "75352b579e4bbb426ae02e833024f277.m.pipedream.net",
    "x-amzn-trace-id": "Root=1-5f5886fb-229bea90db1db618302a9de6",
    "content-length": "596",
    "accept": "application/json",
    "accept-encoding": "gzip, deflate",
    "user-agent": "TFE/1.0 (+https://app.terraform.io; TFE)",
    "content-type": "application/json",
    "x-tfe-notification-signature": ""
  },
  "bodyRaw": "{\"payload_version\":1,\"notification_configuration_id\":\"nc-ygBmbbQWJZAWMse7\",\"run_url\":\"https://tfe.msk.pub/app/org1/tf-aws-simple/runs/run-vnWnJSpBcUFUTaVJ\",\"run_id\":\"run-vnWnJSpBcUFUTaVJ\",\"run_message\":\"Queued manually in Terraform Enterprise\",\"run_created_at\":\"2020-09-09T07:40:15.000Z\",\"run_created_by\":\"mkaesz\",\"workspace_id\":\"ws-FzMaNjmQxjb7W2Ve\",\"workspace_name\":\"tf-aws-simple\",\"organization_name\":\"org1\",\"notifications\":[{\"message\":\"Run Planned and Finished\",\"trigger\":\"run:completed\",\"run_status\":\"planned_and_finished\",\"run_updated_at\":\"2020-09-09T07:40:42.000Z\",\"run_updated_by\":null}]}",
  "body": {
    "payload_version": 1,
    "notification_configuration_id": "nc-ygBmbbQWJZAWMse7",
    "run_url": "https://tfe.msk.pub/app/org1/tf-aws-simple/runs/run-vnWnJSpBcUFUTaVJ",
    "run_id": "run-vnWnJSpBcUFUTaVJ",
    "run_message": "Queued manually in Terraform Enterprise",
    "run_created_at": "2020-09-09T07:40:15.000Z",
    "run_created_by": "mkaesz",
    "workspace_id": "ws-FzMaNjmQxjb7W2Ve",
    "workspace_name": "tf-aws-simple",
    "organization_name": "org1",
    "notifications": [
      {
        "message": "Run Planned and Finished",
        "trigger": "run:completed",
        "run_status": "planned_and_finished",
        "run_updated_at": "2020-09-09T07:40:42.000Z"
      }
    ]
  }
}
```

### Trigger: "run:needs_attention" -> Confirm the apply in the UI
```
{
  "method": "POST",
  "path": "/",
  "query": {},
  "headers": {
    "x-forwarded-for": "35.198.178.114",
    "x-forwarded-proto": "https",
    "x-forwarded-port": "443",
    "host": "75352b579e4bbb426ae02e833024f277.m.pipedream.net",
    "x-amzn-trace-id": "Root=1-5f5887b8-206016084e91e8284f54a880",
    "content-length": "599",
    "accept": "application/json",
    "accept-encoding": "gzip, deflate",
    "user-agent": "TFE/1.0 (+https://app.terraform.io; TFE)",
    "content-type": "application/json",
    "x-tfe-notification-signature": ""
  },
  "bodyRaw": "{\"payload_version\":1,\"notification_configuration_id\":\"nc-ygBmbbQWJZAWMse7\",\"run_url\":\"https://tfe.msk.pub/app/org1/tf-aws-simple/runs/run-3WF8C6WwgvF8LsCL\",\"run_id\":\"run-3WF8C6WwgvF8LsCL\",\"run_message\":\"Queued manually to destroy infrastructure\",\"run_created_at\":\"2020-09-09T07:43:26.000Z\",\"run_created_by\":\"mkaesz\",\"workspace_id\":\"ws-FzMaNjmQxjb7W2Ve\",\"workspace_name\":\"tf-aws-simple\",\"organization_name\":\"org1\",\"notifications\":[{\"message\":\"Run Planned - Needs Confirmation\",\"trigger\":\"run:needs_attention\",\"run_status\":\"planned\",\"run_updated_at\":\"2020-09-09T07:43:52.000Z\",\"run_updated_by\":null}]}",
  "body": {
    "payload_version": 1,
    "notification_configuration_id": "nc-ygBmbbQWJZAWMse7",
    "run_url": "https://tfe.msk.pub/app/org1/tf-aws-simple/runs/run-3WF8C6WwgvF8LsCL",
    "run_id": "run-3WF8C6WwgvF8LsCL",
    "run_message": "Queued manually to destroy infrastructure",
    "run_created_at": "2020-09-09T07:43:26.000Z",
    "run_created_by": "mkaesz",
    "workspace_id": "ws-FzMaNjmQxjb7W2Ve",
    "workspace_name": "tf-aws-simple",
    "organization_name": "org1",
    "notifications": [
      {
        "message": "Run Planned - Needs Confirmation",
        "trigger": "run:needs_attention",
        "run_status": "planned",
        "run_updated_at": "2020-09-09T07:43:52.000Z"
      }
    ]
  }
}
```

### Trigger: "run:applying"
```
{
  "method": "POST",
  "path": "/",
  "query": {},
  "headers": {
    "x-forwarded-for": "35.198.178.114",
    "x-forwarded-proto": "https",
    "x-forwarded-port": "443",
    "host": "75352b579e4bbb426ae02e833024f277.m.pipedream.net",
    "x-amzn-trace-id": "Root=1-5f5887c6-e46d28963cc095cabe019d7f",
    "content-length": "573",
    "accept": "application/json",
    "accept-encoding": "gzip, deflate",
    "user-agent": "TFE/1.0 (+https://app.terraform.io; TFE)",
    "content-type": "application/json",
    "x-tfe-notification-signature": ""
  },
  "bodyRaw": "{\"payload_version\":1,\"notification_configuration_id\":\"nc-ygBmbbQWJZAWMse7\",\"run_url\":\"https://tfe.msk.pub/app/org1/tf-aws-simple/runs/run-3WF8C6WwgvF8LsCL\",\"run_id\":\"run-3WF8C6WwgvF8LsCL\",\"run_message\":\"Queued manually to destroy infrastructure\",\"run_created_at\":\"2020-09-09T07:43:26.000Z\",\"run_created_by\":\"mkaesz\",\"workspace_id\":\"ws-FzMaNjmQxjb7W2Ve\",\"workspace_name\":\"tf-aws-simple\",\"organization_name\":\"org1\",\"notifications\":[{\"message\":\"Run Applying\",\"trigger\":\"run:applying\",\"run_status\":\"applying\",\"run_updated_at\":\"2020-09-09T07:44:06.000Z\",\"run_updated_by\":null}]}",
  "body": {
    "payload_version": 1,
    "notification_configuration_id": "nc-ygBmbbQWJZAWMse7",
    "run_url": "https://tfe.msk.pub/app/org1/tf-aws-simple/runs/run-3WF8C6WwgvF8LsCL",
    "run_id": "run-3WF8C6WwgvF8LsCL",
    "run_message": "Queued manually to destroy infrastructure",
    "run_created_at": "2020-09-09T07:43:26.000Z",
    "run_created_by": "mkaesz",
    "workspace_id": "ws-FzMaNjmQxjb7W2Ve",
    "workspace_name": "tf-aws-simple",
    "organization_name": "org1",
    "notifications": [
      {
        "message": "Run Applying",
        "trigger": "run:applying",
        "run_status": "applying",
        "run_updated_at": "2020-09-09T07:44:06.000Z"
      }
    ]
  }
}
```
##

More details can be found here: [API Documentation](https://www.terraform.io/docs/cloud/api/notification-configurations.html)
