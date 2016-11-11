import datetime
import pytz

Portland = datetime.datetime.now(tz=pytz.timezone('US/Pacific'))
NewYork = datetime.datetime.now(tz=pytz.timezone('America/New_York'))
London = datetime.datetime.now(tz=pytz.timezone('Europe/London'))

if 9 <= Portland.hour <= 21:
    print("We are open here in Portland!")
else:
    print("I'm sorry we are closed here in Portland.")


if 9 <= NewYork.hour <= 21:
    print("We are open here in New York!")
else:
    print("I'm sorry we are closed here in New York.")


if 9 <= London.hour <= 21:
    print("We are open here in London!")
else:
    print("I'm sorry we are closed here in London.")
