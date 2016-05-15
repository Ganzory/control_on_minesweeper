function joystick
cloos
s=serial('com1','BaudRate',9600,'DataBits',8,...
    'Terminator','CR','timeout',0.02,'Terminator', '');
x = 0;
joy=vrjoystick(1);
GG
distance_travelled_per_tick=(pi*6)/800;
k =0;
 while(k==0)
         b = axis(joy, [1 2 ]);
         a=button(joy);
         k = a(10);
         if  (a(3)==1) %no_action
            fopen (s);
            Reeed('z');
            fclose(s);
            
         end
          if  (a(5)==1)%decrease speed
            fopen (s);
            Reeed('i');
            fclose(s);
            
          end
         if  (a(6)==1)%increase speed
            fopen (s);
            Reeed('j');
            fclose(s);
            
         end
   
     if  (b(1)==1&&b(2)==0)%moving in clockwise
        fopen (s);
        Reeed('e');
        fclose(s);
        
     end
     if  (b(1)==-1&&b(2)==0)%moving anti clockwise
       fopen (s);
       Reeed('f');
       fclose(s);
      
     end
     if  (b(1)==0&&b(2)==-1)%movingforward
       fopen (s);
       Reeed('g');
       fclose(s);
      
    end
     if  (b(1)==0&&b(2)==1)%moving down
       fopen (s);
       Reeed('h');
       fclose(s);
     end
     GG
end

    function Reeed(thech)
          
         if s.BytesAvailable == 0
             fprintf(s,thech);
             source ='';
         else
             source=fscanf(s);
         end
         ch1=source; 
         %%%%%%%%%%%%%%%
         if ch1(1) == 'A'
           chaar = length(ch1);
           elmapp(chaar);
        end
        
    end

    function elmapp(lengtth)
             [rr]=data_manipulation(lengtth);
             uu=rr*distance_travelled_per_tick;
             if(uu<=1)
                 map_graph(0,1,20,20)
            
             elseif(uu<=2&&uu>=1)
                
                map_graph(0,2,20,20)
                
             end 
    end
    function GG(varargin)
        instrreset
        if isvalid(s)==0
            s=serial('com1','BaudRate',9600,'DataBits',8,...
                'Terminator','CR','timeout',0.02,'Terminator', '');
        end
    end

    function[tt] = data_manipulation(i)
        x=x + i;
        tt=x
    end
    function cloos(varargin)
        clear ;clc;warning ('off','all')
    end
end