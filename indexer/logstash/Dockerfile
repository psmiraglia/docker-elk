FROM docker.elastic.co/logstash/logstash-oss:6.1.2

LABEL maintainer.email="paolo.smiraglia@gmail.com" \
      maintainer.name="Paolo Smiraglia"

# configure Logstash as needed
COPY logstash.conf /usr/share/logstash/pipeline/
USER root
RUN chown logstash:logstash /usr/share/logstash/pipeline/logstash.conf \
    && chmod 0644 /usr/share/logstash/pipeline/logstash.conf
USER logstash
