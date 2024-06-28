// `include "adder.v"
// `include "ande.v"
// `include "comparator.v"
// `include "subtract.v"

module alu_main(
output wire [4:0]result1,
output wire [4:0]result2,
output wire equal,
output wire greater,
output wire lesser,
output wire [4:0]result4,
input select0,
input select1,
input[3:0] bit1,
input[3:0] bit2
);
 wire[3:0]m1;
    wire[3:0]m2;
  wire[3:0]n1;
    wire[3:0]n2;
  wire[3:0]o1;
    wire[3:0]o2;
  wire[3:0]p1;
    wire[3:0]p2;
wire sc0,sc1;
wire d0,d1,d2,d3;
not(sc0,select0);
not(sc1,select1);
and(d0,sc0,sc1);
and(d1,select0,sc1);
and(d2,select1,sc0);
and(d3,select0,select1);
//for d0
and(m1[0],d0,bit1[0]);
and(m1[1],d0,bit1[1]);
and(m1[2],d0,bit1[2]);
and(m1[3],d0,bit1[3]);
and(m2[0],d0,bit2[0]);
and(m2[1],d0,bit2[1]);
and(m2[2],d0,bit2[2]);
and(m2[3],d0,bit2[3]);
//for d1
and(n1[0],d1,bit1[0]);
and(n1[1],d1,bit1[1]);
and(n1[2],d1,bit1[2]);
and(n1[3],d1,bit1[3]);
and(n2[0],d1,bit2[0]);
and(n2[1],d1,bit2[1]);
and(n2[2],d1,bit2[2]);
and(n2[3],d1,bit2[3]);
//for d2
and(o1[0],d2,bit1[0]);
and(o1[1],d2,bit1[1]);
and(o1[2],d2,bit1[2]);
and(o1[3],d2,bit1[3]);
and(o2[0],d2,bit2[0]);
and(o2[1],d2,bit2[1]);
and(o2[2],d2,bit2[2]);
and(o2[3],d2,bit2[3]);
//for d3
and(p1[0],d3,bit1[0]);
and(p1[1],d3,bit1[1]);
and(p1[2],d3,bit1[2]);
and(p1[3],d3,bit1[3]);
and(p2[0],d3,bit2[0]);
and(p2[1],d3,bit2[1]);
and(p2[2],d3,bit2[2]);
and(p2[3],d3,bit2[3]);
 adder u_adder(
    .final_answer(result1),
    .bit1(m1),
    .bit2(m2)
  );
  
  subtract u_subtract (
    .final_answer(result2),
    .bit1(n1),
    .bit2(n2)
  );

   comparator u_comparator (
    .equal(equal),
.greater(greater),
.lesser(lesser),
    .bit1(o1),
    .bit2(o2)
  );
  ande u_ande (
    .final_answer(result4),
    .bit1(p1),
    .bit2(p2)
  );
endmodule
module subtract(
  output wire [4:0]final_answer,
   input[3:0] bit1,
    input[3:0] bit2
    
);
wire w1,w2,w3,w4,w5,w6,w7,w8;
wire qx1,qx2,qx3,qx4,qx5,qx6,qx7,qx8,qx9,qx10,qx11,qx12;
 xor(w5,bit2[0],1);
                xor(final_answer[0],w5,bit1[0],1);
                and(qx1,1,w5);
                and(qx2,1,bit1[0]);
                and(qx3,bit1[0],w5);
                or(w1,qx3,qx2,qx1);
                xor(w6,bit2[1],1);
                xor(final_answer[1],w6,bit1[1],w1);
                and(qx4,w1,w6);
                and(qx5,w1,bit1[1]);
                and(qx6,bit1[1],w6);
                or(w2,qx5,qx4,qx6);
                xor(w7,bit2[2],1);
                xor(final_answer[2],w2,w7,bit1[2]);
                and(qx7,w2,w7);
                and(qx8,w7,bit1[2]);
                and(qx9,bit1[2],w2);
                or(w3,qx9,qx8,qx7);
                xor(w8,bit2[3],1);
                xor(final_answer[3],w3,w8,bit1[3]);
                and(qx10,w8,w3);
                and(qx11,w3,bit1[3]);
                and(qx12,bit1[3],w8);
                or(w4,qx11,qx12,qx10);
endmodule

module ande(
output wire [4:0]final_answer,
   input[3:0] bit1,
    input[3:0] bit2
);
  and(final_answer[0],bit1[0],bit2[0]);
  and(final_answer[1],bit1[1],bit2[1]);
  and(final_answer[2],bit1[2],bit2[2]);
  and(final_answer[3],bit1[3],bit2[3]);
endmodule

module comparator(
  output wire equal,
output wire greater,
output wire lesser,
   input[3:0] bit1,
    input[3:0] bit2
);
wire y1,y2,y3,y4;
wire a1,a2,a3,a4;
wire b1,b2,b3,b4;
wire xt1,xt2,xt3,xt4;
wire tg1,tg2,tg3,tg4;
  xnor(y1,bit1[0],bit2[0]);
                    xnor(y2,bit1[1],bit2[1]);
                    xnor(y3,bit1[2],bit2[2]);
                    xnor(y4,bit1[3],bit2[3]);
                    and(equal,y1,y2,y3,y4);
                    // equal part completed
                    not(xt1,bit2[0]);
                     not(xt2,bit2[1]);
                    not(xt3,bit2[2]);
                    not(xt4,bit2[3]);
                    and(a1,bit1[3],xt4);
                    and(a2,bit1[2],xt3,y4);
                    and(a3,bit1[1],xt2,y4,y3);
                    and(a4,bit1[0],xt1,y4,y3,y2);
                    or(greater,a1,a2,a3,a4);
                    // greater part com[pleted
                    not(tg1,bit1[0]);
                     not(tg2,bit1[1]);
                    not(tg3,bit1[2]);
                    not(tg4,bit1[3]);
                      and(b1,tg4,bit2[3]);
                    and(b2,tg3,bit2[2],y4);
                    and(b3,tg2,bit2[1],y4,y3);
                    and(b4,tg1,bit2[0],y4,y3,y2);
                    or(lesser,b1,b2,b3,b4);
                    //lesser part completed
endmodule

module adder(
 output  wire[4:0] final_answer,
   input[3:0] bit1,
    input[3:0] bit2
);
wire w1,w2,w3,w4,w5,w6,w7,w8;
 wire we1,we2,we3,we4,we5,we6,we7,we8,we9;
 xor(w5,bit2[0],0);
                xor(final_answer[0],w5,bit1[0],0);
                and(w1,w5,bit1[0]);
                xor(w6,bit2[1],0);
                xor(final_answer[1],w6,bit1[1],w1);
                and(we1,w1,w6);
                 and(we2,w6,bit1[1]);
                 and(we3,w1,bit1[1]);
                or(w2,we3,we1,we2);
                xor(w7,bit2[2],0);
                xor(final_answer[2],w2,w7,bit1[2]);
                 and(we4,w2,w7);
                 and(we5,w2,bit1[2]);
                 and(we6,w7,bit1[2]);
                or(w3,we5,we6,we4);
                xor(w8,bit2[3],0);
                xor(final_answer[3],w3,w8,bit1[3]);
                 and(we7,w3,w8);
                 and(we8,w3,bit1[3]);
                 and(we9,w8,bit1[3]);
                or(final_answer[4],we8,we9,we7);
                
endmodule