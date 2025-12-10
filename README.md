# valkey-nim-lab

A tiny wrapper for Valkey, tested inside a Proxmox LXC container. 

## Setup 

Create a Valkey LXC

```
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/valkey.sh)"
```

Inside the container, install Nim, then:
```
git clone https://github.com/pshankinclarke/valkey-nim-lab.git
cd valkey-nim-lab
nimble run test
```
You should see: 
```
PING -> PONG
GET foo -> bar
```
