#URL='-u http://api-boscore-lib-testnet-ali-boscore-bp-cluster-ap-southeast-1.eosio.sg'
URL='-u http://127.0.0.1:5555'
cleos $URL  system newaccount --stake-net "10.0000 BOS" --stake-cpu "100.0000 BOS" --buy-ram "10.0000 BOS"  eosio voter  EOS7rVBwUzNczTanG8t57apdbMVTbEHcbzTR6gbRpEKPL2Q9X8kWT
sleep 1

cleos $URL transfer eosio voter "10000000.0000 BOS"

sleep 1
cleos $URL transfer bos.stake1 voter "100000000.0000 BOS"

cleos $URL transfer bos.stake2 voter "300000000.0000 BOS"
sleep 1
cleos $URL system delegatebw voter voter "5000000.0000 BOS" "5000000.0000 BOS"


cleos $URL  system newaccount --stake-net "100000.0000 BOS" --stake-cpu "1000000.0000 BOS" --buy-ram "30.0000 BOS"  eosio bostesttps11  EOS7rVBwUzNczTanG8t57apdbMVTbEHcbzTR6gbRpEKPL2Q9X8kWT
cleos $URL  system newaccount --stake-net "100000.0000 BOS" --stake-cpu "1000000.0000 BOS" --buy-ram "30.0000 BOS"  eosio bostesttps12  EOS7rVBwUzNczTanG8t57apdbMVTbEHcbzTR6gbRpEKPL2Q9X8kWT

cleos $URL transfer eosio bostesttps11 "1000000.0000 BOS"
cleos $URL transfer eosio bostesttps12 "1000000.0000 BOS"

#for account in bombay111111 dubai1111111 hongkong1111  siliconvaley franklin1111 london111111
#do
#    cleos $URL  system newaccount --stake-net "10.0000 BOS" --stake-cpu "10.0000 BOS" --buy-ram "10.0000 BOS"  eosio ${account} EOS7rVBwUzNczTanG8t57apdbMVTbEHcbzTR6gbRpEKPL2Q9X8kWT;
#    sleep 1;
#done

for account in bpa bpb bpc bpd bpe bpf bpg bph bpi bpj bpk bpl bpm bpn bpo bpp bpq bpr bps bpt bpu bpv bpw bpx bpy bpz boscorebos11
do
    cleos $URL  system newaccount --stake-net "10.0000 BOS" --stake-cpu "10.0000 BOS" --buy-ram "10.0000 BOS"  eosio ${account} EOS7rVBwUzNczTanG8t57apdbMVTbEHcbzTR6gbRpEKPL2Q9X8kWT;
    sleep 2;
done
#cleos $URL  system newaccount --stake-net "10.0000 BOS" --stake-cpu "10.0000 BOS" --buy-ram "10.0000 BOS"  eosio ${account}


cleos $URL system regproducer bpa EOS5AJf8RyAob36EYhTRmh9bSNCMSTQH8X9dHncEpCvGvEB6YYrkN '' 0
cleos $URL system regproducer bpb EOS8QCio7Tdiyf5c4QKrZHmL4tV359wX8Sr7Fu6adhYcxtWWjnSWe '' 0
cleos $URL system regproducer bpc EOS7zkxSQrvhq8EdggxYvK4UiBhQdYgMfrHyHQApfuM4SQF9tuZYs '' 0
cleos $URL system regproducer bpd EOS7Z3PX2DwUBSTmYU1przha4DLasUqg4P4HQhXjewNYKHbaxQL8K '' 0
cleos $URL system regproducer bpe EOS4v3Te7DAcjWYPuhNgEAxfuJABvHr5YC9ANRVQtB7Zz8yeB6YzC '' 0
cleos $URL system regproducer bpf EOS7XuptYkMZ9yJnFC4N5oBXJtuSwPFA51ir1nA6iTev2JuZjKtHK '' 0
cleos $URL system regproducer bpg EOS7oo8q7qkrFwcYQp9j7YJTqhBnmtpT6cH7v7j4L15o1LFXChHvN '' 0
cleos $URL system regproducer bph EOS7xPPxnNaxwR59XHbg4rP8e1NW59GmgYDKjUeXy4aFP1xumC5HB '' 0
cleos $URL system regproducer bpi EOS7aTMXqZvPwaGmK5yRYicNP9FvtfGXitu2eqktcjhZ3m25yYtwY '' 0


cleos $URL system regproducer bpj EOS6eecJKwQL6Gf5eCTifDf1TC1av8TvCDXNJ3WmnGkHwLbLcjjR4  '' 0
cleos $URL system regproducer bpk EOS6rAmnxrEEhZ1xG15vQ9MLHTWhkpQe7SX4gr7ozLAXUKaVRQ1cg  '' 0
cleos $URL system regproducer bpl EOS7mZNnKLke2oWJJo77yS3cN8NUaQWiNAudCBKJMqKPyVTjW9MHP  '' 0
cleos $URL system regproducer bpm EOS86FkKC6imHAo7Q19FqYyzoMh4kzDWg4EVK2KhpC6CYi2ckMucM  '' 0
cleos $URL system regproducer bpn EOS72QuWMVksTnXF2sgvFhiXkCnteqMqZtarFQGJc8rFDLWHju7AX  '' 0
cleos $URL system regproducer bpo EOS5Yp2ykHHZUc4tLQyedJYPHR5eHMkrbSuo5qZ9F56RyTTwjTvrj  '' 0

cleos $URL system regproducer bpp EOS73pCLr3nqjpa9Y23DiqR1Ywo8PeH5dL6dZe1BTEEcqukrCjhBc '' 0
cleos $URL system regproducer bpq EOS6bWgSPhmaFPpFK1vvYqnp5kVASgoApuaCp2YjkjgoaTCb9g8dq '' 0
cleos $URL system regproducer bpr EOS5ro3pckWdfb7jUGT1N66ozNy6JHLcodNkELpaQkSDsSJ2foqZW '' 0
cleos $URL system regproducer bps EOS6wz6yXv7Ft3ySkhD2RJwEupijTQTW22QRfm8rY74cBGLM2rYg2 '' 0
cleos $URL system regproducer bpt EOS6wj6wgCXusy1JzYHFQxTktbvGbx622NbRVLZtHuW2YDozzAtnz '' 0
cleos $URL system regproducer bpu EOS6WWL3H3j3xQfivaD9uRhCJjZSBgEp59yZeH4XV8dCv8DvykDyt '' 0


cleos $URL system regproducer bpv EOS6FmvragMCP4D1f42gKoMoZMPpoX9HRaPDUzFXSSdonT62LFavK '' 0
cleos $URL system regproducer bpw EOS7ryjbQ4w8GGbxAwQXPoApbAD6VJJrAANygJCmRD76hEqcdG9mY '' 0
cleos $URL system regproducer bpx EOS79kNsGB1zoYx4qPL4aYSZHNj4RL33owDjfdPfWJCXs9jnMNAT3 '' 0
cleos $URL system regproducer bpy EOS6u2pDGYRxvFrdr8dqNbkt7kgLYrxePgYteCLEwjyLDsHLD4Wr3 '' 0
cleos $URL system regproducer bpz EOS8LbUeNp78bB9UvBaiLKz6LuBejwxoixkYXEcVeDXLoZyUr5SKZ '' 0