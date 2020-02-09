
./bin/kafka-topics --bootstrap-server kafka.charliefeng.club:9092 \
--command-config kafka.properties \
--create --replication-factor 3 \
--partitions 1 --topic example


seq 10000 | ./bin/kafka-console-producer \
--topic example --broker-list kafka.charliefeng.club:9092 \
--producer.config kafka.properties


./bin/kafka-console-consumer --from-beginning \
--topic example --bootstrap-server kafka.charliefeng.club:9092 \
--consumer.config kafka.properties