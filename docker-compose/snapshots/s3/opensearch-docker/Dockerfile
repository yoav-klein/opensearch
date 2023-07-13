FROM opensearchproject/opensearch:2.8.0

ENV AWS_ACCESS_KEY_ID=AKIA52T7UHMKTKPNGFEJ
ENV AWS_SECRET_ACCESS_KEY=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
#ENV AWS_SESSION_TOKEN=<session-token>

RUN /usr/share/opensearch/bin/opensearch-plugin install --batch repository-s3
RUN /usr/share/opensearch/bin/opensearch-keystore create

RUN echo $AWS_ACCESS_KEY_ID | /usr/share/opensearch/bin/opensearch-keystore add --stdin s3.client.default.access_key
RUN echo $AWS_SECRET_ACCESS_KEY | /usr/share/opensearch/bin/opensearch-keystore add --stdin s3.client.default.secret_key
#RUN echo $AWS_SECRET_ACCESS_KEY | /usr/share/opensearch/bin/opensearch-keystore add --stdin s3.client.default.session_token
