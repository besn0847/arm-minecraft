# arm-minecraft

To start the container with default config :
```bash
docker run -d -P arm-minecraft
```

But you can also use your local datastore :
```bash
docker run -d -P -v <your local datastore>:/data/world arm-minecraft
```

Only the world maps will be stored locally with the -v option. You still need to connect to the container to change the config (oplevel...).
