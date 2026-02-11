# Inherit from an upstream image
FROM quay.io/jupyter/r-notebook:2024-10-03

# Add additional packages
RUN mamba install --yes \
    'nbgitpuller' \
    'pandas' \
    'geopandas' \
    'matplotlib' \
    'mapclassify' \
    'r-extrafont' \ 
    # FIX: Ensure that we get the split sqlite to avoid clobbering libsqlite.
    #      This was added to fix a broken solve.
    'sqlite>=3.39.0' && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
