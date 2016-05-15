function map_graph(v,b,z,x)
mRows = 19; % Number of Rows.
nColumns = 19; % Number of Columns.
blockSize = 1;
for i = 1:mRows
for j = 1:nColumns

r = (i - 1) * blockSize;
c = (j - 1) * blockSize;
rectangle('position',[c,r,blockSize,blockSize]);
end
end
 rectangle('position',[v,b,blockSize,blockSize],'facecolor',[0.85 0.85 0.85]);
 rectangle('position',[z,x,blockSize,blockSize],'facecolor',[0 0 0]);
 box on
 
axis([0 nColumns*blockSize 0 mRows*blockSize]);
set(gca,'YTick',blockSize/2:blockSize:nColumns*blockSize )
set(gca,'YTickLabel',1:nColumns)
set(gca,'XTick',blockSize/2:blockSize:mRows*blockSize )
set(gca,'XTickLabel',cellstr(char(65:65+mRows-1)'))
end