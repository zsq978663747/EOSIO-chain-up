echo '/tmp/core.%h.%e.%t' > /proc/sys/kernel/core_pattern
ulimit -c unlimited
docker run -d \
--ulimit core=-1 --security-opt seccomp=unconfined \
--name  libtest \
-p 5555:8888 \
-p 9882:9876 \
-v /root/bostest-zsq/lib-test/bosio1/config:/etc/nodeos \
-v /root/bostest-zsq/lib-test/bosio1/data:/data \
winlin/bos:v3.0.0-rc3  \
/opt/eosio/bin/nodeos --config-dir /etc/nodeos --data-dir /data --max-transaction-time=100000 --wasm-runtime wabt  #--genesis-json /etc/nodeos/genesis.json
