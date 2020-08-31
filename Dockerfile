FROM debian:stable-slim
COPY LICENSE README.md /

RUN apt-get -qq update && apt-get -qq install curl unzip && apt clean
RUN curl -fsSL https://deno.land/x/install/install.sh | sh && mv /root/.deno/bin/deno /bin/deno

RUN deno cache https://deno.land/std/examples/welcome.ts
CMD [ "deno", "run", "--allow-net", "https://deno.land/std/examples/welcome.ts" ]
