#how to install docker in ubuntu by bash script automation
#author: Bablish Jaiswal
sudo apt update -y
sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update -y
sudo apt install docker-ce docker-ce-cli containerd.io -y
#adding default user to run docker command without sudo everytime
sudo usermod -aG docker ${USER}
sudo chmod 666 /var/run/docker.sock
sudo apt install git -y
sudo apt install gh -y
sudo apt install unzip -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version

