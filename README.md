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

## run
```
# this can take mp3s or other type files as input, sample shown with wav
cat sample/1284-1180-0010.wav | docker run --rm -i stt
```
should output
```
uncknockeatthedoor of the house and a chubby pleasant faced woman dressed all the blue opened it and greeted the visitors with a smile
```
