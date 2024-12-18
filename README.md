# Deploy AKS with Nginx Ingress and Echo Server

## Prerequisites

To ensure the needed tools are installed, you can use [mise](https://mise.jdx.dev/). You can follow the [getting started guide](https://mise.jdx.dev/getting-started.html)
to install `mise`. Once you have it running you can run the following (inside the
top level of the repository):

```shell
mise trust
mise install -y

```

### Without `mise`

You can install the needed tools yourself. A list of tools can be found in
`mise.toml`

### Setting your subscription ID

Create `.env` environment file with subscription ID environment variable:

```shell
echo "TF_VAR_subscription_id='xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx'" > .env

```

## Create Cluster and deploy

[Taskfile](https://taskfile.dev/) is used to simplify running tasks needed to
launch AKS and deploy nginx+echo-server

You can list all the configured tasks using `task -a`

To create AKS and deploy with single command:

```shell
task deploy

```

You can test the echo-server by using curl or running the following task:

```shell
task curl-echo-server

# Example output
task: [curl-echo-server] curl -H 'Host: echo-server' http://172.210.111.132

{"host":{"hostname":"echo-server","ip":"::ffff:10.244.0.99","ips":[]},"http":{"method":"GET","baseUrl":"","originalUrl":"/","protocol":"http"},"requ
est":{"params":{"0":"/"},"query":{},"cookies":{},"body":{},"headers":{"host":"echo-server","x-request-id":"78b3799a1ff5ed70956ea76bc92dacbe","x-real
-ip":"193.42.54.109","x-forwarded-for":"193.42.54.109","x-forwarded-host":"echo-server","x-forwarded-port":"80","x-forwarded-proto":"http","x-forwar
ded-scheme":"http","x-scheme":"http","user-agent":"curl/8.11.0","accept":"*/*"}},"environment":{"PATH":"/usr/local/sbin:/usr/local/bin:/usr/sbin:/us
r/bin:/sbin:/bin","HOSTNAME":"echo-server-5549c8c7c4-bsj6n","NODE_VERSION":"16.16.0","YARN_VERSION":"1.22.19","ENABLE__FILE":"true","PORT":"80","ENA
BLE__HEADER":"true","ENABLE__REQUEST":"true","LOGS__IGNORE__PING":"false","ENABLE__COOKIES":"true","ENABLE__ENVIRONMENT":"true","ENABLE__HOST":"true
","ENABLE__HTTP":"true","ECHO_SERVER_PORT_80_TCP_PROTO":"tcp","ECHO_SERVER_PORT_80_TCP_ADDR":"10.0.113.240","KUBERNETES_PORT_443_TCP_ADDR":"10.0.0.1
","KUBERNETES_PORT":"tcp://10.0.0.1:443","ECHO_SERVER_SERVICE_HOST":"10.0.113.240","ECHO_SERVER_PORT_80_TCP":"tcp://10.0.113.240:80","ECHO_SERVER_PO
RT_80_TCP_PORT":"80","KUBERNETES_SERVICE_HOST":"10.0.0.1","KUBERNETES_SERVICE_PORT_HTTPS":"443","KUBERNETES_PORT_443_TCP":"tcp://10.0.0.1:443","ECHO
_SERVER_SERVICE_PORT":"80","ECHO_SERVER_SERVICE_PORT_HTTP":"80","ECHO_SERVER_PORT":"tcp://10.0.113.240:80","KUBERNETES_SERVICE_PORT":"443","KUBERNET
ES_PORT_443_TCP_PROTO":"tcp","KUBERNETES_PORT_443_TCP_PORT":"443","HOME":"/root"}}
```

## Deleting all resources

You can simply run `task tf:destroy`

This will delete all resources that was created using OpenTofu in Azure
