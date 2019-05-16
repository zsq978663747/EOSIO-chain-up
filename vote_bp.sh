SELECTED=()
URL='-u http://127.0.0.1:5555'
shuffle_and_select_bps(){
  N=21
  BPS=( bpa bpb bpc bpd bpe bpf bpg  bph bpi bpj bpk bpl bpm bpn bpo bpp bpq bpr bps bpt bpu bpv bpw bpx  bpy bpz )
  tmp=()
  for index in $(shuf --input-range=0-$(( ${#BPS[*]} - 1 )) -n ${N})
  do
      tmp+=(${BPS[$index]})
  done
  SELECTED=($(echo "${tmp[@]}" | sed 's/ /\n/g' | sort))
}

shuffle_and_select_bps
# new_array=($(echo "${SELECTED[@]}" | sed 's/ /\n/g' | sort))
echo ${SELECTED[@]}

while :
do
./unlock_wallet.sh
shuffle_and_select_bps
cleos $URL system voteproducer prods voter  ${SELECTED[*]} -p voter
echo "sleep 1200 seconds"
sleep 5
done