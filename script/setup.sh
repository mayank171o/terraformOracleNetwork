mkdir samp

#install Java

#sudo apt install openjdk-8-jdk -y

#refesh ip tables

sudo iptables-save > ~/iptables-rules
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -F

#install docker

sudo apt-get install \
   apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y
	
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable" -y
	

  sudo apt-get install docker-ce docker-ce-cli containerd.io -y
  sudo docker run -d -p 8080:8080 mayank1783/fibonacci-sequence

