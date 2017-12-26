#!/usr/bin/python3

import os
import sys
import logging
import subprocess

# add this path to the PYTHONPATH
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

logging.basicConfig(level=logging.INFO)

deepspeech_executable = '/usr/local/bin/deepspeech'
graph_file = '/app/data/graph/output_graph.pb'
sound_file = '/app/output.wav'
abc = '/app/data/alphabet.txt'
lm_bin = '/app/data/lm/lm.binary'
lm_trie = '/app/data/lm/trie'

if __name__ == '__main__' :

    # copy incoming text to say.txt
    with open('./input.wav', 'wb') as writer:
        writer.write(sys.stdin.buffer.read())

    # convert wav to right format
    with open(os.devnull, 'w') as f_null:
        subprocess.call(["/usr/bin/ffmpeg", "-i", "./input.wav", "-acodec", "pcm_s16le",
                         "-ac", "1", "-ar", "16000", "./output.wav"], stdout=f_null, stderr=f_null)

    process = subprocess.Popen([deepspeech_executable, graph_file, sound_file, abc, lm_bin, lm_trie],
                                stdout=subprocess.PIPE)
    out, err = process.communicate()
    if err is not None:
        raise ValueError(err)
    # change bytes back to text
    text = out.decode("utf-8")
    print(text)
