# deepTools is a suite of python tools particularly developed for the efficient analysis of high-throughput sequencing data, such as ChIP-seq, RNA-seq or MNase-seq.
# Reference page > https://deeptools.readthedocs.io/en/develop/
# Citation > Ramírez, Fidel, Devon P. Ryan, Björn Grüning, Vivek Bhardwaj, Fabian Kilpert, Andreas S. Richter, Steffen Heyne, Friederike Dündar, and Thomas Manke. deepTools2: A next Generation Web Server for Deep-Sequencing Data Analysis. Nucleic Acids Research (2016). doi:10.1093/nar/gkw257.

# To execute the contents of the .bashrc file in the current shell session (necessary to start conda)
    source ~/.bashrc

# In a clean environment:

    cd anaconda3/envs/                                   # go to your anaconda3 directory
    
    conda create -n deepTools                            # create an environment
    
    cd anaconda3/envs/deepTools/                         # go to your working environment
    
    conda activate deepTools                             # activate conda environment
    
    conda install -c bioconda deeptools                  # install deeptools

    # or pip install deeptools

# create your working directory for your methylartist environment
    mkdir deepTools             # working directory should be outside the anaconda3 directory
    cd deepTools                # go to your deepTools working directory

# activate the methylartist environment in your working directory
    conda activate deepTools             #activate conda environment


#################################################################################################

# you can work with slurm command for necessary jobs

#################################################################################################