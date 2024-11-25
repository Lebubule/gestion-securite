import requests
import re

r = requests.get('https://official-joke-api.appspot.com/random_joke', auth=('user', 'pass'))

texte = r.text

regex = r'"setup":"(.*?)","punchline":"(.*?)"'
match = re.search(regex, texte)

if match:
    question = match.group(1)
    punchline = match.group(2)
    print(question)
    print(punchline)
