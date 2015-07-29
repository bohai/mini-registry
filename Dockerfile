FROM scratch

COPY ./registry /registry
COPY ./config.yml /config.yml
COPY ./lib64 /lib64
COPY ./bin /bin

EXPOSE 5000
ENTRYPOINT ["/registry"]
CMD ["/config.yml"]
