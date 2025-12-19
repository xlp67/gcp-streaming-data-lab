FROM gcr.io/dataflow-templates-base/python310-template-launcher-base

ENV FLEX_TEMPLATE_PYTHON_MAIN_FILE="/template/main.py"

COPY pipelines/main.py /template/main.py
RUN pip install --no-cache-dir apache-beam[gcp]==2.52.0

ENTRYPOINT ["/opt/google/dataflow/python_template_launcher"]