docker run -d -p 3000:3000 \
           --name grafana \
           -v /home/ubuntu/monitoring/grafana.ini:/etc/grafana/grafana.ini \
           -v grafana-storage:/var/lib/grafana \
            grafana/grafana

#INSTALL PROMETHEUS
# we keep the config file for persistence and later use
 docker run -d -p 9090:9090 \
            --name prometheus \
            -v /home/ubuntu/monitoring/prometheus.yml:/etc/prometheus/prometheus.yml \
            prom/prometheus
