# Ubuntu 20.04 has library versions compatible with the RM520
#FROM arm32v7/ubuntu:20.04
FROM ghcr.io/natecarlson/rm520-modem-buildenv:main
# Metadata
LABEL maintainer="Nate Carlson <git@natecarlson.com>"
LABEL org.label-schema.application="rm520-build-env"

ARG buildTarget=rm520
ARG version=1

# Add apt config to only install direct requirements
#COPY 99minimal-apt-installs /etc/apt/apt.conf.d/
ADD entry-point.sh /opt/entry-point.sh

# Only update/install packages if need to address potential security issues
# Uncomment the following lines to enable package updates and installations
#RUN apt update \
#        && apt -y install build-essential git libffi-dev pkg-config patchelf  \
#        && apt -y install apt ca-certificates curl wget vim ssh \
#        && apt -y install python3 \
#        && mkdir -p /opt/builds && mkdir -p /opt/rm520 \

# Comment the next line if uncommenting above lines
RUN mkdir -p /opt/builds && mkdir -p /opt/rm520 \
        && cd /opt/rm520 \
        && git clone https://github.com/clndwhr/sms_tool.git \
        && cd sms_tool/for_modem_AP \
        && sed -i -e "s/VERSION .*/VERSION \"$(date +%Y.%-m).${version}-APmod-iamromulan\"/" sms_main.c \
        && make \
        && chmod 755 /opt/entry-point.sh \
        && chown 1000:1000 /opt/entry-point.sh \
        && mv /opt/rm520/sms_tool/for_modem_AP/sms_tool /opt/rm520/sms_tool/for_modem_AP/sms_tool-${buildTarget}

ENV LC_ALL=en_US.UTF-8

#CMD ["bash"]
ENTRYPOINT ["bash", "/opt/entry-point.sh"]