#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade

sudo apt-get install -y git

#install go
if [[ -z "$GOPATH" ]];then
    echo "Installing Golang"
	wget https://go.dev/dl/go1.20.3.linux-amd64.tar.gz
    sudo tar -xvf go1.20.3.linux-amd64.tar.gz
    sudo mv go /usr/local
    export GOROOT=/usr/local/go
    export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
    echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
    echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
    echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
    source ~/.bash_profile
    sleep 1
fi


#create a tools folder in ~/
mkdir ~/tools
cd ~/tools/


#install aquatone
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
echo "done"


#install sublister
echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd ~/tools/
echo "done"


#install subfinder
echo "installing subfinder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
cd ~/tools/
echo "done"


#install assetfinder
echo "installing assetfinder"
go get -u github.com/tomnomnom/assetfinder
cd ~/tools/
echo "done"


#install amass
echo "installing amass"
go install -v github.com/owasp-amass/amass/v3/...@master
cd ~/tools/
echo "done"


#install httprobe
echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe 
echo "done"



echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la
