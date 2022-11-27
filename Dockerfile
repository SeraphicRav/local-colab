FROM python:3.10-bullseye

RUN useradd --shell /bin/sh worker --home /app -m 

USER worker
WORKDIR /app
ENV PATH=/app/.local/bin:$PATH

RUN pip3 install poetry jupyter jupyter_http_over_ws \
  && jupyter serverextension enable --py jupyter_http_over_ws

COPY --chown=worker:worker . .

RUN poetry install \
  && poetry run jupyter serverextension enable --py jupyter_http_over_ws \
  && poetry run python3 -m spacy download ja_core_news_trf

EXPOSE 8888

CMD ["poetry", "run", "jupyter", "notebook" ,"--NotebookApp.allow_origin=https://colab.research.google.com", "--NotebookApp.port_retries=0", "--ip=0.0.0.0", "--port=8888", "--no-browser"]