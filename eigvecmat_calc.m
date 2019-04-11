function eigvecmat_calc(inputmat,genefile,k,outname)
% inputmat: expression compendia matrix (n gene X m experiments)
% genefile: indices for genes (GeneName \t i)
% k: number of cluster
% outpref: prefix for output files

disp (' - loading data / similarity matrix calculation')
a=importdata(inputmat);
dmat = squareform(pdist(a.data));
smat = exp(-(dmat).^2 ./ (2*(std2(dmat))^2));

% ordered list of genes
genedata = importdata(genefile);
genes=genedata.textdata;
geneIDs=genedata.data;

% normalized Laplacian
disp(' - calculating mean(D) added Laplacian');
rng('shuffle');
for i=1:length(smat)
	smat(i,i)=0;
end
dd = sum(smat);
dd = sum(smat) + mean(dd); 	% adding mean
dd(dd==0)=1;			% mean added
D = diag(dd);			% mean added
L = eye(size(D,1)) - (D^-.5)*smat*(D^-.5);

% eigenvector calculation
disp(' - calculating eigenvectors');
[V,D] = eigs(L,k,'SM');

% row normalization
TEV = V(:,(1:k));
EV = TEV;
for j=1:size(TEV,1)
        EV(j,:) = TEV(j,:)/norm(TEV(j,:));
end

strout = strcat(outname,'.eigvecs.matrix.txt')
result_eigvec=table(genes, EV);
writetable(result_eigvec,strout,'Delimiter','\t','WriteVariableNames',false);

return

