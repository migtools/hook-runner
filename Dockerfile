FROM quay.io/openshift/origin-cli:4.20 as cli

FROM quay.io/ansible/ansible-runner:stable-2.12-latest
RUN pip3 install --upgrade 'urllib3>=2.7.0' 'pyasn1>=0.6.3' 'aiohttp>=3.13.3'
COPY --from=cli /usr/bin/oc /usr/bin/oc
RUN pip3 install kubernetes openshift
RUN ansible-galaxy collection install kubernetes.core
RUN chmod 777 /home/runner/.ansible && chmod 777 /home/runner/.ansible/tmp
RUN mkdir /.ansible && chmod 777 /.ansible
USER 65534:65534
