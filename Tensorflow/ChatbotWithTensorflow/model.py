import nltk
from nltk.stem.lancaster import LancasterStemmer

import numpy as np
import tensorflow as tf
import tflearn
import random
import json

stemmer = LancasterStemmer()

with open('intents.json', 'r') as i:
    intents = json.load(i)

word = []
classes = []
documents = []
ignore_words = ['?', '!', ',', '.']
for intent in intents['intents']:
    for pattern in intent['patterns']:
        w = nltk.word_tokenize(pattern)
        word.extend(w)