FROM ubuntu:18.04

WORKDIR app

RUN apt-get update && apt-get install \
-y --no-install-recommends python3 python3-virtualenv

COPY . .

RUN pwd
RUN ls

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m virtualenv --python=/usr/bin/python3 $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install -r requirements.txt

CMD [ "python", "./app.py" ]
