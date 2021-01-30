# wooey-multi-arch is a multi-architecture docker image for [Wooey](https://wooey.readthedocs.io/en/latest/running_wooey.html)

## wooey-multi-arch v1 - Example usage

Start Wooey (Simple):

```bash
docker run -p 8000:8000 adrianoamalfi/wooey-docker:latest
```

Start Wooey (local consistence & daemon mode):

```bash
docker run -p 8000:8000 -v $(pwd)/local:/code -d adrianoamalfi/wooey-docker:latest
```

Connect to http://IPADDRESS:8000 
Username: admin
Password: changeme

Start a Wooey server with Postgres DB and RabbitMQ:

```bash
WIP
```
# wooey-docker
# wooey-docker
