FROM alpine:3.18

# 'nobody' user in alpine
USER 65534
# The workaround for actions/upload-artifact limit, it doesn't preserve the file permissions
# https://github.com/actions/upload-artifact#permission-loss
COPY --chmod=775 rbac-manager /

ENTRYPOINT ["/rbac-manager"]
CMD ["--log-level=info"]
