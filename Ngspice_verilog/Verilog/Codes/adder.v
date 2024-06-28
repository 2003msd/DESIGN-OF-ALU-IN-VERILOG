
module adder(
 output  wire[4:0] final_answer,
   input[3:0] bit1,
    input[3:0] bit2
);
wire w1,w2,w3,w4,w5,w6,w7,w8;
 xor(w5,bit2[0],0);
                xor(final_answer[0],w5,bit1[0],0);
                and(w1,w5,bit1[0]);
                xor(w6,bit2[1],0);
                xor(final_answer[1],w6,bit1[1],w1);
                or(w2,w1 & bit1[1],w1 & w6,w6 & bit1[1]);
                xor(w7,bit2[2],0);
                xor(final_answer[2],w2,w7,bit1[2]);
                or(w3,w2 & bit1[2],bit1[2] & w7,w2 & w7);
                xor(w8,bit2[3],0);
                xor(final_answer[3],w3,w8,bit1[3]);
                or(final_answer[4],w3 & bit1[3],bit1[3] & w8,w3 & w8);
                
endmodule