BASE_TAG=psmiraglia/elk
BUILD_CMD=docker build

broker: broker-zookeeper broker-kafka

broker-zookeeper:
	$(BUILD_CMD) --tag $(BASE_TAG)/broker/zookeeper ./broker/zookeeper

broker-kafka:
	$(BUILD_CMD) --tag $(BASE_TAG)/broker/kafka ./broker/kafka
