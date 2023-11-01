#!/bin/bash
#SBATCH --job-name=deepTools_PMD_vs_Genes
#SBATCH --time=48:00:00 # hh:mm:ss

#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=60000 # 60G
#SBATCH --mail-user=usernamex@xmail.com
#SBATCH --mail-type=ALL
#
#SBATCH --comment=Devepi

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

BIGWIG="/path/to/your_directory/BigWig_files"
BED="/path/to/your_directory/BED_files"

computeMatrix scale-regions \
-S $BIGWIG/WT_1.spleen.bw \
$BIGWIG/WT_2.spleen.bw \
$BIGWIG/KO.spleen.bw \
$BIGWIG/KO_2.spleen.bw \
-R $BED/PMD_mm10_genes_sorted.bed \
$BED/HMD_mm10_genes_sorted.bed \
--binSize 100 \
--regionBodyLength 5000 \
-a 5000 -b 5000 \
--outFileName PMD_HMD_mm10_Genes.gz \

plotProfile --matrixFile PMD_HMD_mm10_Genes.gz \
    --perGroup \
    --yMin 0 \
    --yMax 100 \
    --plotHeight 12 \
    --plotWidth 17 \
    --outFileNameData 100_PMD_HMD_mm10_Genes.tab \
    --outFileName 100_PMD_HMD_mm10_Genes.pdf \
    --plotTitle "Methylation over mm10 Genes around PMDs & HMDs (bin=100bp)" \
    --colors "blue" "green" "red" "orange" \
    --plotFileFormat "pdf" \
    --dpi 300 \
  

