.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

up: ## Starts all the containers required run the demo
	docker-compose up -d

clickhouse-set-schemas: ## Set the schemas for the demo
	docker-compose exec clickhouse bash -c "cat /opt/init.sql | clickhouse-client -m -n"

rabbit-insert-messages: ## Insert messages in defined queue
	docker-compose exec rabbitmq bash -c "/opt/resources/publisher.sh"

clickhouse-read-events: ## Read from the materialized view
	docker-compose exec clickhouse bash -c "clickhouse-client --query=\"SELECT * FROM event.event LIMIT 10 FORMAT PrettyCompactMonoBlock\""

down: ## Shuts down all the containers and removes their volume
	docker-compose down --volumes --remove-orphans