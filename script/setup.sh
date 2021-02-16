
#install Java
#sudo apt install openjdk-14-jdk -y

#install docker

#sudo apt-get install \
 #   apt-transport-https \
  #  ca-certificates \
   # curl \
    #gnupg-agent \
    #software-properties-common -Y
	
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	
#sudo add-apt-repository \
 #  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  # $(lsb_release -cs) \
   #stable"
	

#sudo apt-get install docker-ce docker-ce-cli containerd.io

#open ports on machine

#open port

#sudo iptables-save > ~/iptables-rules
#sudo iptables -P INPUT ACCEPT
#sudo iptables -P OUTPUT ACCEPT
#sudo iptables -P FORWARD ACCEPT
#sudo iptables -F

#Download and run docker image

#docker login --username=yourhubusername --password=password
#docker tag <imagename> yourhubusername/verse_gapminder:latest
#docker push yourhubusername/verse_gapminder
#docker run -p 8080:8080 <imagename>


