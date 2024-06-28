`timescale 1ns/1ps

module r1();

  // Inputs
  reg select0, select1;
  reg [3:0] bit1, bit2;
  
  // Outputs
  wire [4:0] result1, result2, result4;
  wire equal, greater, lesser;
  
  r2 u_alu (
    .result1(result1),
    .result2(result2),
    .equal(equal),
    .greater(greater),
    .lesser(lesser),
    .result4(result4),
    .select0(select0),
    .select1(select1),
    .bit1(bit1),
    .bit2(bit2)
  );
  
  // Stimulus
  initial begin
     $dumpfile("A_m.vcd");
    $dumpvars(0,r1);
    // Test Case 1: Addition (select0=0, select1=0)
    select0 = 0;
    select1 = 0;
    bit1 = 4'b0110; 
    bit2 = 4'b1100; 
    #10; 
    $display("Result1 (Addition): %b", result1);
    $display("Result2 (Subtraction): %b", result2);
    $display("Equal: %b, Greater: %b, Lesser: %b", equal, greater, lesser);
     $display("Result4 (AND): %b", result4);

    // // Test Case 2: Subtraction (select0=1, select1=0)
    select0 = 1;
    select1 = 0;
    bit1 = 4'b1010; 
    bit2 = 4'b0010; 
    #10; 
      $display("Result1 (Addition): %b", result1);
    $display("Result2 (Subtraction): %b", result2);
    $display("Equal: %b, Greater: %b, Lesser: %b", equal, greater, lesser);
     $display("Result4 (AND): %b", result4);
    
    // // Test Case 3: Comparison (select0=0, select1=1)
    select0 = 0;
    select1 = 1;
    bit1 = 4'b1011;
    bit2 = 4'b1111; 
    #10; 
      $display("Result1 (Addition): %b", result1);
    $display("Result2 (Subtraction): %b", result2);
    $display("Equal: %b, Greater: %b, Lesser: %b", equal, greater, lesser);
     $display("Result4 (AND): %b", result4);
    
    // // Test Case 4: AND (select0=1, select1=1)
    select0 = 1;
    select1 = 1;
    bit1 = 4'b1111; 
    bit2 = 4'b0000; 
    #10; 
     $display("Result1 (Addition): %b", result1);
    $display("Result2 (Subtraction): %b", result2);
    $display("Equal: %b, Greater: %b, Lesser: %b", equal, greater, lesser);
     $display("Result4 (AND): %b", result4);
    
    // End the simulation
    $finish;
  end

endmodule