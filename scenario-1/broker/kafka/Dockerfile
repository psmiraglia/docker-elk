FROM openjdk:jre-alpine

LABEL maintainer.email="paolo.smiraglia@gmail.com" \
      maintainer.name="Paolo Smiraglia"

ENV KAFKA_HOME=/opt/kafka \
    KAFKA_USER=kafka \
    KAFKA_GROUP=kafka \
    KAFKA_VERSION=1.0.0 \
    SCALA_VERSION=2.12

# install kafka
RUN apk --update --no-cache add \
        bash \
    && wget http://it.apache.contactlab.it/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -O /tmp/kafka.tar.gz \
    && mkdir -p ${KAFKA_HOME} \
    && addgroup -S ${KAFKA_GROUP} \
    && adduser -h ${KAFKA_HOME} -s /sbin/nologin -G ${KAFKA_GROUP} -S -D ${KAFKA_USER} \
    && cd ${KAFKA_HOME} \
    && tar xf /tmp/kafka.tar.gz --strip-components=1 \
    && rm -fr \
        ${KAFKA_HOME}/bin/windows \
        ${KAFKA_HOME}/site-docs \
    && chown -R ${KAFKA_USER}:${KAFKA_GROUP} ${KAFKA_HOME} \
    && rm -fr \
        /tmp/* \
        /var/cache/apk/*

# add bootstrap script
COPY --chown=kafka:kafka bootstrap.sh ${KAFKA_HOME}/bin/
RUN chmod +x ${KAFKA_HOME}/bin/bootstrap.sh

EXPOSE 9092/tcp

WORKDIR ${KAFKA_HOME}
USER ${KAFKA_USER}

CMD ["bin/bootstrap.sh"]
