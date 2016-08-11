# checkup-docker
Docker file for checkup

# How-to
Clone and configure a working checkup locally according to https://github.com/sourcegraph/checkup and provision the S3 environment.  Clone this repo and copy the working checkup.json to this directory from your working checkup setup.  

```
docker build .
docker run -dit $(container that is created from the build)
```

Given the above you can put it in a CI/CD pipeline and constantly create new checkers.


Then you either copy out and host the statuspage directory somewhere permanent since you will be able to treat the container emphemerally.  You can use nginx or something dirt simple like a bash script the looks something like this:

```
#!/usr/bin/env bash
echo -e "Ethernet:\t `ipconfig getifaddr en0 2> /dev/null`"
sudo python -m SimpleHTTPServer $1
```


