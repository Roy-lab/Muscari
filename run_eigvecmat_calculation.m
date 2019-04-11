function run_eigvecmat_calculation(k)

for species={'ath','mtr','osa','ppa','stu','zma'}
	matrix=sprintf('sample_data/%s_sample_matrix.txt',species{1})
	gnlist=sprintf('sample_data/%s_matrix_gnids.txt',species{1})
	outpref=species{1};

	eigvecmat_calc(matrix,gnlist,k,outpref)
end

quit
