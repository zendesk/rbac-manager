FROM alpine:3.18

COPY rbac-manager /
# The workaround for actions/upload-artifact limit
# https://github.com/actions/upload-artifact#zipped-artifact-downloads
# It needs to be before USER
RUN chmod +x rbac-manager

# 'nobody' user in alpine
USER 65534

ENTRYPOINT ["/rbac-manager"]
CMD ["--log-level=info"]
