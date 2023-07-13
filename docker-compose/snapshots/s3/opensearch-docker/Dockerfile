FROM opensearchproject/opensearch:2.8.0

ENV AWS_ACCESS_KEY_ID=AKIA4JPQNULLSOJYLTFM
ENV AWS_SECRET_ACCESS_KEY=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

# Optional
ENV AWS_SESSION_TOKEN=ABC

RUN /usr/share/opensearch/bin/opensearch-plugin install --batch repository-s3
RUN /usr/share/opensearch/bin/opensearch-keystore create

RUN echo $AWS_ACCESS_KEY_ID | /usr/share/opensearch/bin/opensearch-keystore add --stdin s3.client.default.access_key
RUN echo $AWS_SECRET_ACCESS_KEY | /usr/share/opensearch/bin/opensearch-keystore add --stdin s3.client.default.secret_key

