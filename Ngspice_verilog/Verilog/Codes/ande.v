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