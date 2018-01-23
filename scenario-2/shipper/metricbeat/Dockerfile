FROM docker.elastic.co/beats/metricbeat:6.1.2

LABEL maintainer.email="paolo.smiraglia@gmail.com" \
      maintainer.name="Paolo Smiraglia"

# configure Metricbeat as needed
COPY metricbeat.yml /usr/share/metricbeat/metricbeat.yml
USER root
RUN chown root:metricbeat /usr/share/metricbeat/metricbeat.yml \
    && chmod 640 /usr/share/metricbeat/metricbeat.yml
USER metricbeat
