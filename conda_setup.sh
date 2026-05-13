#! /bin/bash

source $MYSCRATCH/miniconda3/bin/activate
conda create -n deepspot python=3.9 pip
conda activate deepspot

pip install --upgrade pip setuptools wheel —no-cache-dir
pip install numpy pandas scipy anndata scanpy squidpy matplotlib scikit-learn —-no-cache-dir
pip install torch==2.7.1 torchvision==0.22.1 torchaudio==2.7.1 --index-url https://download.pytorch.org/whl/rocm6.3 —-no-cache-dir
pip install lightning plotnine ipykernel huggingface_hub transformers timm scikit-misc —-no-cache-dir
python -m ipykernel install --user --name deepspot --display-name "deepspot"

cd $MYSCRATCH/DeepSpot
python setup.py install

conda install -c conda-forge jupyterlab -y
conda install conda-forge::nodejs -y 
conda install conda-forge::jupyter-server-proxy -y

conda deactivate
