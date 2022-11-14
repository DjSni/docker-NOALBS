# docker-NOALBS

I created this Docker file to create an easier integration for UnRAID with Environment Variables.

Environment Variables
There are other environment variables if you want to customize various things inside the docker container:

Recommended Variables:

| Variable | Default | Value | Descrption |
| --- | --- | --- | --- |
| CONFIG_DIR | config | the config dir | The sub dir of the config |
| TWITCH_BOT_USERNAME |  - | botname | We recommend using your main Twitch BOT account for this, but if you do not have a Twitch Bot account just use your Main Twitch Account. |
| TWITCH_BOT_OAUTH | - | oauth:YOUR_OAUTH_HERE | Use https://twitchapps.com/tmi to get your oauth from Twitch. |

### docker-compose
```docker-compose
version: '3'
  noalbs:
    image: dersni/docker-noalbs:latest
    volumes:
      - /path/to/docker/dir/noalbs/config:/app/config
    environment:
      - CONFIG_DIR=config
      - TWITCH_BOT_USERNAME=BotName
      - TWITCH_BOT_OAUTH=oauth:1234abce
```

### docker run
```docker
docker run -e 'CONFIG_DIR'='config' -e 'TWITCH_BOT_USERNAME'='BotName' -e 'TWITCH_BOT_OAUTH'='oauth:1234abce' -v /path/to/docker/dir/noalbs/config:/app/config:rw dersni/docker-noalbs:latest
```
