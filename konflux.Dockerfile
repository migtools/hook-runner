FROM registry.redhat.io/ansible-automation-platform-25/platform-resource-runner-rhel8:latest
RUN chmod 777 /home/runner/.ansible && chmod 777 /home/runner/.ansible/tmp
RUN mkdir /.ansible && chmod 777 /.ansible
COPY /licenses /licenses
COPY entrypoint /bin/entrypoint
RUN chmod 755 /bin/entrypoint
USER 65534:65534

LABEL \
        "io.k8s.description"="Migration Toolkit for Containers Hook Runner" \
        "io.k8s.display-name"="Migration Toolkit for Containers" \
        "io.openshift.tags"="migration" \
        "summary"="Migration Toolkit for Containers Hook Runner" \
        "io.openshift.maintainer.project"="MIG"
