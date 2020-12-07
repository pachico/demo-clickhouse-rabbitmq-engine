# Demo ClickHouse RabbitMQ Engine

This demos shows how to publish messages to `RabbitMQ` and then consume them from `ClickHouse`.

## Requirements

- `docker-compose`
- `make` (unless you want to launch the commands manually)

## Run it

The Makefile is self documented. Type `make help` to get its content:

```txt
up                             Starts all the containers required run the demo
clickhouse-set-schemas         Set the schemas for the demo
rabbit-insert-messages         Insert messages in defined queue
clickhouse-read-events         Read from the materialized view
down                           Shuts down all the containers and removes their volume
```

Execute the commands in this order to run the demo.