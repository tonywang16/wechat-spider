import urllib
import json
import re
from bs4 import BeautifulSoup

web = urllib.urlopen("http://mp.weixin.qq.com/s?timestamp=1476369792&src=3&ver=1&signature=lmdxN1Z5v5SfurbAqO0C6n*eNNQRoWNpyfDlEOeDSIOFqoB92*y1vKfznSrrk2qgvpkCqkmW3qoarYCJEh11ocRTl9RnSRVHerzGzxAQSlbz87YPa5qQGr8irIunUt40H4T*qiPEkP2OerLZZpRYGyht0f*Knl3rijqlW3s8F0A=")
soup = BeautifulSoup(web.read(),'lxml')
print re.search('.*var msg_link.*', str(soup)).group(0)

msg_link=re.search('var msg_link = \"(.+?)\"', str(soup)).group(1)
print re.sub('amp;','',msg_link)
scripts = soup.find_all('script')
reg = re.compile('.*var msg_link.*')
#for script in scripts:
#	m = re.search('.*var msg_link.*', script)
#	m.group(0)
