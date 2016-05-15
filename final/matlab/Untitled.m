 joy=vrjoystick(1)
 s=serial('com27','BaudRate',9600,'DataBits',8);
  i=0;
 while(1)
         b = axis(joy, [1 2 ]);
         a=button(joy,[1 2 3 4 5 6 7 8 9 10 11 12]);
         if  (a(3)==1)%no_action
            fopen (s);
         fprintf(s,'z');
         fclose(s);
         end
          if  (a(5)==1)%decrease speed
            fopen (s);
         fprintf(s,'i');
         fclose(s);
          end
         if  (a(6)==1)%increase speed
            fopen (s);
         fprintf(s,'j');
         fclose(s);
         end
   
     if  (b(1)==1&&b(2)==0)%moving in clockwise
       fopen (s);
         fprintf(s,'e');
          fclose(s);
     end
     if  (b(1)==-1&&b(2)==0)%moving anti clockwise
       fopen (s);
         fprintf(s,'f');
          fclose(s);
     end
     if  (b(1)==0&&b(2)==-1)%movingforward
       fopen (s);
         fprintf(s,'g');
          fclose(s);
    end
     if  (b(1)==0&&b(2)==1)%moving down
       fopen (s);
         fprintf(s,'h');
          fclose(s);
     end
 end