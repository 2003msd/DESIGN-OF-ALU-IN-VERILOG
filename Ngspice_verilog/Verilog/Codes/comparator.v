module comparator(
  output wire [4:0]final_answer,
   input[3:0] bit1,
    input[3:0] bit2
);
wire y1,y2,y3,y4;
wire a1,a2,a3,a4;
wire b1,b2,b3,b4;

  xnor(y1,bit1[0],bit2[0]);
                    xnor(y2,bit1[1],bit2[1]);
                    xnor(y3,bit1[2],bit2[2]);
                    xnor(y4,bit1[3],bit2[3]);
                    and(final_answer[0],y1,y2,y3,y4);
                    // equal part completed
                    and(a1,bit1[3],~bit2[3]);
                    and(a2,bit1[2],~bit2[2],y4);
                    and(a3,bit1[1],~bit2[1],y4,y3);
                    and(a4,bit1[0],~bit2[0],y4,y3,y2);
                    or(final_answer[1],a1,a2,a3,a4);
                    // greater part com[pleted
                      and(b1,~bit1[3],bit2[3]);
                    and(b2,~bit1[2],bit2[2],y4);
                    and(b3,~bit1[1],bit2[1],y4,y3);
                    and(b4,~bit1[0],bit2[0],y4,y3,y2);
                    or(final_answer[2],b1,b2,b3,b4);
                    //lesser part completed
endmodule