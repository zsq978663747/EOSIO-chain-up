
PUBKEY='EOS7hHHDtnPRbhMmfHJHUEKQyiutKrt9wZPdy1JbaATVLyxpCkrop'
PRIKEY='<private-key>'

#step 3: import private-key
#cleos wallet import --private-key <private-key>

# step 4: set contract eosio.bios
URL='-u http://api-boscore-lib-testnet-boscore-bp-cluster-ap-northeast-1.eosio.sg'

CONTRACTS_FOLDER='../../bos.contract-prebuild' 
cleos $URL set contract eosio ${CONTRACTS_FOLDER}/eosio.bios -p eosio

# step 5: create system accounts

for account in eosio.bpay eosio.msig eosio.names eosio.ram eosio.ramfee eosio.saving eosio.stake eosio.token eosio.vpay eosio.wrap bos.dev bos.gov redpacket bos.btc bos.eth bos.eos
do 
    echo -e "\n creating $account \n"; 
    cleos $URL create account eosio ${account} $PUBKEY; 
    sleep 1; 
done

cleos $URL  create account eosio bos $PUBKEY

for account in uid bos.stake1 bos.stake2  bos.stake3
do 
    echo -e "\n creating $account \n"; 
    cleos $URL create account eosio ${account} $PUBKEY; 
    sleep 1; 
done

for account in bos.dapp bos.boost bos.airdrop
do 
    echo -e "\n creating $account \n"; 
    cleos $URL create account eosio ${account} $PUBKEY; 
    sleep 1; 
done

# set an abp 
cleos  $URL create account eosio boscoretokyo EOS7B2h89KDYXzVNj6G8MLkFgQExfns1ssTH19MkDTPcFBTfssJb4
sleep 1
cleos $URL push action eosio setprods '{"schedule":[{"producer_name":"boscoretokyo","block_signing_key":"EOS7B2h89KDYXzVNj6G8MLkFgQExfns1ssTH19MkDTPcFBTfssJb4"}]}' -p eosio

# step 6: set token and msig contract
cleos $URL set contract eosio.token ${CONTRACTS_FOLDER}/eosio.token -p eosio.token 
cleos $URL set contract eosio.msig ${CONTRACTS_FOLDER}/eosio.msig -p eosio.msig

# step 7: create and issue token

cleos $URL push action eosio.token create '["eosio", "10000000000.0000 BOS"]' -p eosio.token 
sleep 1
cleos $URL push action eosio.token issue '["eosio", "1013000000.0000 BOS", "BOSCore"]' -p eosio
sleep 1

# setp 8: setting privileged account for eosio.msig

cleos $URL push action eosio setpriv '{"account": "eosio.msig", "is_priv": 1}' -p eosio
sleep 3
# step 9: set contract eosio.system

cleos $URL set contract eosio ${CONTRACTS_FOLDER}/eosio.system -x 3600 -p eosio

sleep 1
cleos $URL push action eosio init '{"version": 0, "core": "4,BOS"}' -p eosio

# step 10: set contract eosio.wrap
sleep 1
cleos $URL set contract eosio.wrap ${CONTRACTS_FOLDER}/eosio.wrap -x 1000 -p eosio.wrap
sleep 1
# step 11: transfer some token 

cleos $URL transfer eosio bos        "100000000 BOS"
cleos $URL transfer eosio bos.stake1 "300000000 BOS"
cleos $URL transfer eosio bos.stake2 "300000000 BOS"
cleos $URL transfer eosio bos.stake3 "200000000 BOS"

cleos $URL transfer eosio bos.dapp    "70000000 BOS"
cleos $URL transfer eosio bos.boost   "20000000 BOS"
#cleos -u http://127.0.0.1:7777 transfer eosio bos.airdrop "10000000 BOS"


# step last: resign all system account
#for account in eosio.bpay eosio.msig eosio.names eosio.ram eosio.ramfee eosio.saving eosio.stake eosio.token eosio.vpay
#do
# cleos push action eosio updateauth '{"account": "'$account'", "permission": "active", "parent": "owner", "auth":{"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": active}}]}}' -p ${account}@active
#  cleos push action eosio updateauth '{"account": "'$account'", "permission": "owner", "parent": "",       "auth":{"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio", "permission": active}}]}}' -p ${account}@owner
# sleep 1;
#done

## check system accounts
#for account in eosio.bpay eosio.msig eosio.names eosio.ram eosio.ramfee eosio.saving eosio.stake eosio.token eosio.vpay
#do
 # echo --- ${account} --- && cleos get account ${account} && sleep 1;
#done

#cleos push action eosio updateauth '{"account": "eosio", "permission": "active", "parent": "owner", "auth":{"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio.prods", "permission": active}}]}}' -p eosio@active
#cleos push action eosio updateauth '{"account": "eosio", "permission": "owner", "parent": "",       "auth":{"threshold": 1, "keys": [], "waits": [], "accounts": [{"weight": 1, "permission": {"actor": "eosio.prods", "permission": active}}]}}' -p eosio@owner

## check eosio
cleos $URL get account eosio
