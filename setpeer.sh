
#!/bin/bash
export ORDERER_CA=/opt/ws/crypto-config/ordererOrganizations/orderernet/msp/tlscacerts/tlsca.orderernet-cert.pem

if [ $# -lt 2 ];then
	echo "Usage : . setpeer.sh Seller|Transporter|Buyer| <peerid>"
fi
export peerId=$2

if [[ $1 = "Seller" ]];then
	echo "Setting to organization Seller peer "$peerId
	export CORE_PEER_ADDRESS=$peerId.sellernet:7051
	export CORE_PEER_LOCALMSPID=SellerMSP
	export CORE_PEER_TLS_CERT_FILE=/opt/ws/crypto-config/peerOrganizations/sellernet/peers/$peerId.sellernet/tls/server.crt
	export CORE_PEER_TLS_KEY_FILE=/opt/ws/crypto-config/peerOrganizations/sellernet/peers/$peerId.sellernet/tls/server.key
	export CORE_PEER_TLS_ROOTCERT_FILE=/opt/ws/crypto-config/peerOrganizations/sellernet/peers/$peerId.sellernet/tls/ca.crt
	export CORE_PEER_MSPCONFIGPATH=/opt/ws/crypto-config/peerOrganizations/sellernet/users/Admin@sellernet/msp
fi

if [[ $1 = "Transporter" ]];then
	echo "Setting to organization Transporter peer "$peerId
	export CORE_PEER_ADDRESS=$peerId.transnet:7051
	export CORE_PEER_LOCALMSPID=TransporterMSP
	export CORE_PEER_TLS_CERT_FILE=/opt/ws/crypto-config/peerOrganizations/transnet/peers/$peerId.transnet/tls/server.crt
	export CORE_PEER_TLS_KEY_FILE=/opt/ws/crypto-config/peerOrganizations/transnet/peers/$peerId.transnet/tls/server.key
	export CORE_PEER_TLS_ROOTCERT_FILE=/opt/ws/crypto-config/peerOrganizations/transnet/peers/$peerId.transnet/tls/ca.crt
	export CORE_PEER_MSPCONFIGPATH=/opt/ws/crypto-config/peerOrganizations/transnet/users/Admin@transnet/msp
fi

if [[ $1 = "Buyer" ]];then
	echo "Setting to organization Buyer peer "$peerId
	export CORE_PEER_ADDRESS=$peerId.buyernet:7051
	export CORE_PEER_LOCALMSPID=BuyerMSP
	export CORE_PEER_TLS_CERT_FILE=/opt/ws/crypto-config/peerOrganizations/buyernet/peers/$peerId.buyernet/tls/server.crt
	export CORE_PEER_TLS_KEY_FILE=/opt/ws/crypto-config/peerOrganizations/buyernet/peers/$peerId.buyernet/tls/server.key
	export CORE_PEER_TLS_ROOTCERT_FILE=/opt/ws/crypto-config/peerOrganizations/buyernet/peers/$peerId.buyernet/tls/ca.crt
	export CORE_PEER_MSPCONFIGPATH=/opt/ws/crypto-config/peerOrganizations/buyernet/users/Admin@buyernet/msp
fi

	