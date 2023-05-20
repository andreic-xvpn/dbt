import requests

url = "http://192.168.1.117:8000"

payload={}
headers = {
  '': ''
}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
