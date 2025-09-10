# Inherit from an upstream image
FROM quay.io/jupyter/r-notebook:2024-10-03

# Add additional packages
RUN mamba install --yes \
    'nbgitpuller' \
    'pandas' \
    'geopandas' \
    'matplotlib' \
    'mapclassify' \
    'r-extrafont' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
