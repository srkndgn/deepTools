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
-S $BIGWIG/Sample_01_H3K9me3.bw \
-R $BED/mm10_all_genes.bed \
--binSize 10 \
--regionBodyLength 5000 \
-a 5000 -b 5000 \
--outFileName H3K9me3_mm10_Genes_heatmap.gz \

plotProfile --matrixFile H3K9me3_mm10_Genes_heatmap.gz \
    --perGroup \
    --plotHeight 12 \
    --plotWidth 17 \
    --outFileNameData 10_ESCs_mm10_Genes.tab \
    --outFileName 10_ESCs_mm10_Genes.pdf \
    --plotTitle "CpG methylation around mm10 Genes (bin=10bp)" \
    --colors "green" "orange" "red" \
    --plotFileFormat "pdf" \
    --dpi 300 \
  
  
plotHeatmap \
 --matrixFile H3K9me3_mm10_Genes_heatmap.gz \
 --outFileName 10_ESCs_H3K9me3_mm10_Genes_heatmap.pdf \
 --missingDataColor "#FFF6EB" \
 --heatmapHeight 6 \
 --yMin 0 --yMax 25 \
 --plotTitle 'H3K9me3 around mm10_Genes (bin=10bp)' \
 --regionsLabel 'CpGs in mESCs'
