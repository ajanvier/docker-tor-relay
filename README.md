## Instructions

### Middle relay

```bash
docker run -d \
	--restart always \
	-v /etc/localtime:/etc/localtime:ro \
	-p 9001:9001 \
	-e RELAY_NICKNAME='mydockerrelay' \
	-e CONTACT_NAME='Tor Admin' \
	-e CONTACT_EMAIL='tor[at]example[dot]com' \
	-e CONTACT_GPG_FINGERPRINT='0xFFFFFFFF' \
	--name tor-relay \
	ajanvier/tor-relay
```

### Bridge relay


```bash
docker run -d \
	--restart always \
	-v /etc/localtime:/etc/localtime:ro \
	-p 9001:9001 \
    -e RELAY_TYPE='bridge' \
	-e RELAY_NICKNAME='mydockerrelay' \
	-e CONTACT_NAME='Tor Admin' \
	-e CONTACT_EMAIL='tor[at]example[dot]com' \
	-e CONTACT_GPG_FINGERPRINT='0xFFFFFFFF' \
	--name tor-relay \
	ajanvier/tor-relay
```

### Exit relay

### Bridge relay

```bash
docker run -d \
	--restart always \
	-v /etc/localtime:/etc/localtime:ro \
	-p 9001:9001 \
    -e RELAY_TYPE='bridge' \
	-e RELAY_NICKNAME='mydockerrelay' \
	-e CONTACT_NAME='Tor Admin' \
	-e CONTACT_EMAIL='tor[at]example[dot]com' \
	-e CONTACT_GPG_FINGERPRINT='0xFFFFFFFF' \
	--name tor-relay \
	ajanvier/tor-relay
```

## Environment variables

| Name                         | Description                                                                  | Default value |
| ---------------------------- |:----------------------------------------------------------------------------:| -------------:|
| **RELAY_TYPE**               | The type of relay (bridge, middle or exit)                                   | middle        |
| **RELAY_NICKNAME**           | The nickname of your relay                                                   | mydockerrelay |
| **CONTACT_GPG_FINGERPRINT**  | Your GPG ID or fingerprint                                                   | none          |
| **CONTACT_NAME**             | Your name                                                                    | none          |
| **CONTACT_EMAIL**            | Your contact email                                                           | none          |
| **RELAY_BANDWIDTH_RATE**     | Limit how much traffic will be allowed through your relay (must be > 20KB/s) | 100 KBytes    |
| **RELAY_BANDWIDTH_BURST**    | Allow temporary bursts up to a certain amount                                | 200 KBytes    |
