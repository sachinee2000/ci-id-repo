FROM python:3.10-slim

# Install dependencies
RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt

# Download spaCy model
RUN python -m spacy download en_core_web_sm

# Copy app code
COPY app.py /app/app.py
WORKDIR /app

# Expose port and run the app
EXPOSE 8010
CMD ["python", "app.py"]
