docker build . -t amineau/teamspeak
docker run --name teamspeak -p "9987:9987/udp" -p 10011:10011 -p 30033:30033 amineau/teamspeak
