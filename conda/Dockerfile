FROM continuumio/miniconda3:latest

# Set the working directory
WORKDIR /app

# Install procps-ng for ps command
RUN apt-get update && \
    apt-get install -y procps && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the entrypoint script and environment file to the container
COPY entrypoint.sh /
COPY prokka_env.yml .

# Create the conda environment
RUN conda env create -f prokka_env.yml && \
    conda clean -afy

# Download the Prokka databases
RUN conda run -n prokka_env prokka --setupdb

SHELL ["conda", "run", "-n", "prokka_env", "/bin/bash", "-c"]

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
