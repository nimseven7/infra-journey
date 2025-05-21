# my-fastapi

A FastAPI-based example project for building modern, fast (high-performance), web APIs with Python 3.13 based on standard Python type hints.

## Features

- FastAPI application for building RESTful APIs
- Infrastructure as code with Terraform (see `infra/terraform`)
- Easily extensible and deployable

## Requirements

- Python 3.13+
- [FastAPI](https://fastapi.tiangolo.com/)
- [Terraform](https://www.terraform.io/) (for infrastructure)
- [uv](https://docs.astral.sh/uv/)
- [docker](https://www.docker.com/) (optional, for containerization)
- [docker-compose](https://docs.docker.com/compose/) (optional, for local development)

## Setup

1. **Clone the repository:**
    ```bash
    git clone git@github.com:nimseven7/infra-journey.git
    cd services/infra-journey
    ```

2. **Create and activate a virtual environment:**
    ```bash
    python3 -m venv venv
    source venv/bin/activate
    ```

3. **Install dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

4. **(Optional) Setup infrastructure:**
    ```bash
    cd infra/terraform
    terraform init
    terraform apply
    ```

## Usage

1. **Run the FastAPI application:**
    ```bash
    uvicorn main:app --reload
    ```

2. **Access the API docs:**
    - Open [http://localhost:8000/docs](http://localhost:8000/docs) in your browser.

## Project Structure

- `services/my-fastapi/app/main.py` - FastAPI application entrypoint
- `infra/terraform/` - Infrastructure as code scripts and configuration
- `services/my-fastapi/uv.lock` - Python dependencies

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the [MIT License](LICENSE).
