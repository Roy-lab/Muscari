#!/bin/sh
set -u

k=$1		# number of clusters
outdir=$2	# name of output directory

best=ath	# best known species name
p=0.8		# transition probability (default=0.8)
x=0.01		# fixed covariance (default=0.01)
orderf=sample_data/SpeciesOrder.txt	# species order filename
ogidsf=sample_data/sample_OGID.txt	# OGID filename
treef=sample_data/SpeciesTree.txt	# species tree filename
configf=sample_data/config.txt		# config filename



# prepare eigenvector matrices for spectral clustering
matlab -r run_eigvecmat_calculation\($k\)
echo " - Eigenvctor matrices prepared."



# run muscari
i=1
while [[ $i -lt 2 ]]
do

	./code/muscari -s $orderf -e $ogidsf -k ${k} -t $treef -c $configf -r yes -o $outdir -m learn -b $best -i uniform -p $p -x $x -w true -f true

	check="${outdir}/allspecies_clusterassign_lca_brk.txt"
	if [ -f "$check" ]
	then
        	((i = i + 1))
	fi

done

