# Simple speech to text docker container based on Mozilla's DeepSpeech

## build
```
docker build -t stt .
```

## run
```
cat sample/1284-1180-0010.wav | docker run --rm -i stt
```

