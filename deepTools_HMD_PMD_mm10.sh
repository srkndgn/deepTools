#!/bin/bash
#SBATCH --job-name=WGBS_HMD_PMD
#SBATCH --time=2:0:0 # hh:mm:ss

#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=40000 # 40G
#SBATCH --mail-user=usernamex@xmail.com
#SBATCH --mail-type=ALL
#
#SBATCH --comment=Your research Group name or comment

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

__conda_setup="$('/path/to/your_directory/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/path/to/your_directory/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/path/to/your_directory/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/path/to/your_directory/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# <<< conda initialize <<<

conda activate deepTools

BIGWIG="/path/to/your_directory/BigWig_files" # location of your bigwig files
BED="/path/to/your_directory/BED_files"       # location of your bed files

computeMatrix scale-regions \
-R $BED/your_region_of_interest_01.bed \
$BED/your_region_of_interest_02.bed \
-S $BIGWIG/WT_1.spleen.bw \
$BIGWIG/WT_sample_01.bw \
$BIGWIG/KO_sample_02.bw \

--binSize 10 \
--regionBodyLength 10000 \
-a 1000 -b 1000 \
--outFileName promoter_CpG_island_shores.gz \

plotProfile --matrixFile spromoter_CpG_island_shores.gz \
    --perGroup \
    --yMin 0 \
    --yMax 100 \
    --plotHeight 10 \
    --plotWidth 17 \
    --outFileName promoter_CpG_island_shores.pdf \
    --plotTitle "CpG methylation around promoter_CpG_island_shores (bin=10bp)" \
    --colors "green" "orange" \
    --plotFileFormat "pdf" \
    --dpi 300 \
  

