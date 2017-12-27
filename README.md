# Simple speech to text docker container based on Mozilla's DeepSpeech

## cache
if you want to try it out and make changes, I recommend you cache the Speech to Text binaries locally first;
```
./dl.sh
```

## build
```
docker build -t stt .
```

## run service on port 82
```
docker run -d --rm -p 81:80 --name tts -i tts
```

post data to service for testing (this can take mp3s or other type files as input, sample shown with wav)
```
curl -X POST -F "file=@sample/1284-1180-0010.wav" http://localhost/api/v1/stt
```

should output
```
uncknockeatthedoor of the house and a chubby pleasant faced woman dressed all the blue opened it and greeted the visitors with a smile
```
