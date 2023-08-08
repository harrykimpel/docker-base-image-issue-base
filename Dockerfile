FROM alpine:3.16.7
#FROM openjdk:11-ea-9

RUN apk add --no-cache bash

# Create default application directory '/app' and set ownership to 1001:0 (arbitrary user, root group)
RUN mkdir /app && chown -R 1001:0 /app

# Set work directory to /app
WORKDIR /app

# Set default user to 1001
# Note: OpenShift runs containers with an arbitrary user id (https://docs.openshift.com/container-platform/3.11/creating_images/guidelines.html).
#   To allow this arbitrary user to execute the image's application as intended, it is recommended that the root group (gid 0) is given permission to
#   all required directories, scripts, etc., since the arbitrary user will be part of that group. For execution in a non-OpenShift environment,
#   the user 1001 should be used as a "placeholder" and given the same permissions as group 0. Running as the root user (uid 0) is not recommended and
#   will fail a deployment into OpenShift.

USER 1001
