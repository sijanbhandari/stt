#!/bin/bash

if [ ! -f "./deepspeech-0.1.0-models.tar.gz" ]; then
  wget --no-check-certificate https://github.com/mozilla/DeepSpeech/releases/download/v0.1.0/deepspeech-0.1.0-models.tar.gz
fi
