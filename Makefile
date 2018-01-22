BASE_TAG=psmiraglia/elk
BUILD_CMD=docker build

default: broker indexer shipper

broker: broker-zookeeper broker-kafka

broker-zookeeper:
	$(BUILD_CMD) --tag $(BASE_TAG)/broker/zookeeper ./broker/zookeeper

broker-kafka:
	$(BUILD_CMD) --tag $(BASE_TAG)/broker/kafka ./broker/kafka

indexer: indexer-logstash

indexer-logstash:
	$(BUILD_CMD) --tag $(BASE_TAG)/indexer/logstash ./indexer/logstash

shipper: shipper-metricbeat

shipper-metricbeat:
	$(BUILD_CMD) --tag $(BASE_TAG)/shipper/metricbeat ./shipper/metricbeat
