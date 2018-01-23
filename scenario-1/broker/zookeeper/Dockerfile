FROM openjdk:jre-alpine

LABEL maintainer.email="paolo.smiraglia@gmail.com" \
      maintainer.name="Paolo Smiraglia"

ENV ZK_HOME=/opt/zookeeper \
    ZK_USER=zookeeper \
    ZK_GROUP=zookeeper \
    ZK_VERSION=3.4.10

# install zookeeper
RUN apk --update --no-cache add \
        bash \
    && wget http://it.apache.contactlab.it/zookeeper/zookeeper-${ZK_VERSION}/zookeeper-${ZK_VERSION}.tar.gz -O /tmp/zookeeper.tar.gz \
    && mkdir -p ${ZK_HOME} \
    && addgroup -S ${ZK_GROUP} \
    && adduser -h ${ZK_HOME} -s /sbin/nologin -G ${ZK_GROUP} -S -D ${ZK_USER} \
    && cd ${ZK_HOME} \
    && tar xf /tmp/zookeeper.tar.gz --strip-components=1 \
    && cp ${ZK_HOME}/conf/zoo_sample.cfg ${ZK_HOME}/conf/zoo.cfg \
    && rm -fr \
        ${ZK_HOME}/bin/*.cmd \
        ${ZK_HOME}/docs \
    && chown -R ${ZK_USER}:${ZK_GROUP} ${ZK_HOME}

# add bootstrap script
COPY --chown=zookeeper:zookeeper bootstrap.sh ${ZK_HOME}/bin/
RUN chmod +x ${ZK_HOME}/bin/bootstrap.sh

EXPOSE 2181/tcp

WORKDIR ${ZK_HOME}
USER ${ZK_USER}

CMD ["bin/bootstrap.sh"]
