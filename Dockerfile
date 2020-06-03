FROM python:3.8.3-slim-buster

RUN apt-get update && apt-get install -y \
    libgomp1 \
    gcc \
    g++

RUN pip install --no-cache-dir --upgrade pip 
RUN pip install --no-cache-dir \
    numpy==1.18.0 \
    joblib==0.15.1 \
    pandas==1.0.4 \
    scikit-learn==0.23.1 \
    matplotlib==3.2.1 \
    seaborn==0.10.1 \
    lightgbm==2.3.1 \
    jupyterlab==2.1.4 \
    shap==0.35.0

# Create a user in the image so containers do not run as root
RUN useradd --create-home appuser
WORKDIR /home/appuser
USER appuser

EXPOSE 8888

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser"]