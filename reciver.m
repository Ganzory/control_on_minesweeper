function reciver(d)
if(d=='A')
[rr]=data_manipulation(1);
uu=rr*distance_travelled_per_tick;
if(uu<=1)
map_graph(0,1,20,20)
end
if(uu<=2&uu>=1)
map_graph(0,1,20,20)   
end
end
if(d=='B')
end
