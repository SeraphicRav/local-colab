# AI

## Installation

```bash
pip3 install poetry jupyter jupyter_http_over_ws
jupyter serverextension enable --py jupyter_http_over_ws
poetry install 
poetry run jupyter serverextension enable --py jupyter_http_over_ws
poetry run python3 -m spacy download ja_core_news_trf
```

## Run

```bash
poetry run jupyter notebook --NotebookApp.allow_origin=https://colab.research.google.com --NotebookApp.port_retries=0 --port=8888 --no-browser
```

