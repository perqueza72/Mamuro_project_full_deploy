FROM public.ecr.aws/zinclabs/zinc:latest
COPY . /data
WORKDIR /data
VOLUME [ "/data/zinc/data" ]

ENV ZINC_FIRST_ADMIN_USER=admin
ENV ZINC_FIRST_ADMIN_PASSWORD=Complexpass#123
ENV ZINC_DATA_PATH="."

EXPOSE 4080