//////////////////////////////////////////////////////
module myNOR2 (F, A, B);
input A,B;
output wire F;

specify
   if ({A,B}==2'b00) (A,B *> F) =  10; //can cause rise
   if ({A,B}==2'b01) (A,B *> F) =  6; //can cause fall
   if ({A,B}==2'b10) (A,B *> F) =  6; //can cause fall
   if ({A,B}==2'b11) (A,B *> F) =  3; //can cause fall
endspecify

nor inst1 (F,A,B);

endmodule

////////////////////////////////////////////////////////
module myINV (F, A);
input A;
output wire F;

specify
   if ({A}==1'b0) (A *> F) =  3; //can cause rise
   if ({A}==1'b1) (A *> F) =  3; //can cause fall
endspecify

not inst1 (F,A);

endmodule
////////////////////////////////////////////////////////
module myNAND2 (F, A, B);
input A,B;
output wire F;

specify
   if ({A,B}==2'b00) (A,B *> F) =  3; //can cause rise
   if ({A,B}==2'b01) (A,B *> F) =  6; //can cause rise
   if ({A,B}==2'b10) (A,B *> F) =  6; //can cause rise
   if ({A,B}==2'b11) (A,B *> F) =  8; //can cause fall
endspecify

  nand inst1 (F,A,B);

endmodule
/////////////////////////////////////////////////////////
////////////////BASE GATE DEFINITIONS END////////////////
/////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////
////////////////MULTIPLE INPUT AND GATES/////////////////
/////////////////////////////////////////////////////////


module myAND2 (F, A, B);
input A,B;
output wire F;

wire temp;
myNAND2 inst1 (temp,A,B);
myINV inst2 (F, temp);

endmodule

////////////////////////////////////////////////////////

module myAND3 (F, A, B, C);
input A,B,C;
output wire F;

wire temp;
  myAND2 inst1 (temp,A,B);
  myAND2 inst2 (F, temp,C);
  


endmodule
/////////////////////////////////////////////////////////
module myAND4 (F, A, B, C, D);
input A,B,C,D;
output wire F;

wire temp;
  myAND3 inst1 (temp,A,B,C);
  myAND2 inst2 (F, temp,D);

endmodule
/////////////////////////////////////////////////////////
module myAND5 (F, A, B, C, D, E);
  
  input A, B, C, D, E;
  output wire F;

  wire temp;
  myAND4 inst1 (temp,A,B,C,D);
  myAND2 inst2 (F, temp,E);

endmodule


////////////////////////////////////////////////////////





module myExOR (F, A, B);
  input A, B;
  output wire F;

  wire temp1,temp2,temp3;
  
  myNAND2 inst1(temp1,A,B);
  myNAND2 inst2(temp2,A,temp1);
  myNAND2 inst3(temp3,B,temp1);
  myNAND2 inst4(F,temp2,temp3);


endmodule




// module myExOR (F, A, B);
// input A, B;
// output wire F;

// assign F = A^B;

// endmodule

////////////////////////////////////////////////////////


////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
module myOR4 (F, A, B, C, D);
input A,B,C,D;
output wire F;

wire temp;
myOR3 inst1 (temp,A,B,C);
myOR2 inst2 (F, temp, D);

endmodule




////////////////////////////////////////////////////////


////////////////////////////////////////////////////////


////////////////////////////////////////////////////////
module myOR5 (F, A, B, C, D, E);
input A,B,C,D,E;
output wire F;

wire temp;
  myOR4 inst1 (temp,A,B,C,D);
  myOR2 inst2 (F, temp,E);

endmodule

////////////////////////////////////////////////////////

module myOR3 (F, A, B, C);
input A,B,C;
output wire F;

wire temp;
myOR2 inst1 (temp,A,B);
myOR2 inst2 (F, temp, C);

endmodule






////////////////////////////////////////////////////////
module myOR2 (F, A, B);
input A,B;
output wire F;

wire temp;
myNOR2 inst1 (temp,A,B);
myINV inst2 (F, temp);

endmodule

////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
module myNAND4 (F, A, B, C, D);
input A,B,C,D;
output wire F;

specify
  if ({A,B,C,D}==4'b0000) (A,B,C,D *> F) =  3; //can cause rise
  if ({A,B,C,D}==4'b0001) (A,B,C,D *> F) =  6; //can cause rise
  if ({A,B,C,D}==4'b0010) (A,B,C,D *> F) =  6; //can cause rise
  if ({A,B,C,D}==4'b0011) (A,B,C,D *> F) =  8; //can cause fall
  if ({A,B,C,D}==4'b0100) (A,B,C,D *> F) =  3; //can cause rise
  if ({A,B,C,D}==4'b0101) (A,B,C,D *> F) =  6; //can cause rise
  if ({A,B,C,D}==4'b0110) (A,B,C,D *> F) =  6; //can cause rise
  if ({A,B,C,D}==4'b0111) (A,B,C,D *> F) =  8; //can cause fall
  if ({A,B,C,D}==4'b1000) (A,B,C,D *> F) =  3; //can cause rise
  if ({A,B,C,D}==4'b1001) (A,B,C,D *> F) =  6; //can cause rise
  if ({A,B,C,D}==4'b1010) (A,B,C,D *> F) =  6; //can cause rise
  if ({A,B,C,D}==4'b1011) (A,B,C,D *> F) =  8; //can cause fall
  if ({A,B,C,D}==4'b1100) (A,B,C,D *> F) =  3; //can cause rise
  if ({A,B,C,D}==4'b1101) (A,B,C,D *> F) =  6; //can cause rise
  if ({A,B,C,D}==4'b1110) (A,B,C,D *> F) =  6; //can cause rise
  if ({A,B,C,D}==4'b1111) (A,B,C,D *> F) =  8; //can cause fall
endspecify

  nand inst1 (F,A,B,C,D);

endmodule
//////////////////////////////////////////////////////
////////////////////////////////////////////////////////
////////////////////////////////////////////////////////

////////////////////////////////////////////////////////
module myNAND3 (F, A, B, C);
input A,B,C;
output wire F;

  
  
  
  
  
  
  
specify
  if ({A,B,C}==3'b000) (A,B,C *> F) =  3; //can cause rise
  if ({A,B,C}==3'b001) (A,B,C *> F) =  6; //can cause rise
  if ({A,B,C}==3'b010) (A,B,C *> F) =  6; //can cause rise
  if ({A,B,C}==3'b011) (A,B,C *> F) =  8; //can cause fall
  if ({A,B,C}==3'b100) (A,B,C *> F) =  3; //can cause rise
  if ({A,B,C}==3'b101) (A,B,C *> F) =  6; //can cause rise
  if ({A,B,C}==3'b110) (A,B,C *> F) =  6; //can cause rise
  if ({A,B,C}==3'b111) (A,B,C *> F) =  8; //can cause fall
endspecify

  nand inst1 (F,A,B,C);

endmodule

////////////////////////////////////////////////////////
module myNAND5 (F, A, B, C, D, E);
input A,B,C,D,E;
output wire F;

specify
  if ({A,B,C,D,E}==5'b00000) (A,B,C,D,E *> F) =  3; //can cause rise
  if ({A,B,C,D,E}==5'b00001) (A,B,C,D,E *> F) =  6; //can cause rise
  if ({A,B,C,D,E}==5'b00010) (A,B,C,D,E *> F) =  6; //can cause rise
  if ({A,B,C,D,E}==5'b00011) (A,B,C,D,E *> F) =  8; //can cause fall
  if ({A,B,C,D,E}==5'b00100) (A,B,C,D,E *> F) =  3; //can cause rise
  if ({A,B,C,D,E}==5'b00101) (A,B,C,D,E *> F) =  6; //can cause rise
  if ({A,B,C,D,E}==5'b00110) (A,B,C,D,E *> F) =  6; //can cause rise
  if ({A,B,C,D,E}==5'b00111) (A,B,C,D,E *> F) =  8; //can cause fall
  if ({A,B,C,D,E}==5'b01000) (A,B,C,D,E *> F) =  3; //can cause rise
  if ({A,B,C,D,E}==5'b01001) (A,B,C,D,E *> F) =  6; //can cause rise
  if ({A,B,C,D,E}==5'b01010) (A,B,C,D,E *> F) =  6; //can cause rise
  if ({A,B,C,D,E}==5'b01011) (A,B,C,D,E *> F) =  8; //can cause fall
  if ({A,B,C,D,E}==5'b01100) (A,B,C,D,E *> F) =  3; //can cause rise
  if ({A,B,C,D,E}==5'b01101) (A,B,C,D,E *> F) =  6; //can cause rise
  if ({A,B,C,D,E}==5'b01110) (A,B,C,D,E *> F) =  6; //can cause rise
  if ({A,B,C,D,E}==5'b01111) (A,B,C,D,E *> F) =  8; //can cause fall
  
  if ({A,B,C,D,E}==5'b10000) (A,B,C,D,E *> F) =  3; //can cause rise
  if ({A,B,C,D,E}==5'b10001) (A,B,C,D,E *> F) =  6; //can cause rise
  if ({A,B,C,D,E}==5'b10010) (A,B,C,D,E *> F) =  6; //can cause rise
  if ({A,B,C,D,E}==5'b10011) (A,B,C,D,E *> F) =  8; //can cause fall
  if ({A,B,C,D,E}==5'b10100) (A,B,C,D,E *> F) =  3; //can cause rise
  if ({A,B,C,D,E}==5'b10101) (A,B,C,D,E *> F) =  6; //can cause rise
  if ({A,B,C,D,E}==5'b10110) (A,B,C,D,E *> F) =  6; //can cause rise
  if ({A,B,C,D,E}==5'b10111) (A,B,C,D,E *> F) =  8; //can cause fall
  if ({A,B,C,D,E}==5'b11000) (A,B,C,D,E *> F) =  3; //can cause rise
  if ({A,B,C,D,E}==5'b11001) (A,B,C,D,E *> F) =  6; //can cause rise
  if ({A,B,C,D,E}==5'b11010) (A,B,C,D,E *> F) =  6; //can cause rise
  if ({A,B,C,D,E}==5'b11011) (A,B,C,D,E *> F) =  8; //can cause fall
  if ({A,B,C,D,E}==5'b11100) (A,B,C,D,E *> F) =  3; //can cause rise
  if ({A,B,C,D,E}==5'b11101) (A,B,C,D,E *> F) =  6; //can cause rise
  if ({A,B,C,D,E}==5'b11110) (A,B,C,D,E *> F) =  6; //can cause rise
  if ({A,B,C,D,E}==5'b11111) (A,B,C,D,E *> F) =  8; //can cause fall
endspecify

  nand inst1 (F,A,B,C,D,E);

endmodule
//////////////////////////////////////////////////////
module cla_64_bit(A, B, Cin, S, Carry, Cout);

input [63:0] A, B;
input Cin;
output wire [63:0] S;
output wire [63:0] Carry;
output wire Cout;

wire carry1, carry2, carry3;
wire [3:0] g, p;
wire c1, c2, c3, c4;
cla_16_bit inst0(A[15:0], B[15:0], Cin, S[15:0], Carry[15:0], carry1, g[0], p[0]);
cla_16_bit inst1(A[31:16], B[31:16], c1, S[31:16], Carry[31:16], carry2, g[1], p[1]);
cla_16_bit inst2(A[47:32], B[47:32], c2, S[47:32], Carry[47:32], carry3, g[2], p[2]);
cla_16_bit inst3(A[63:48], B[63:48], c3, S[63:48], Carry[63:48], Cout, g[3], p[3]);
block_cla_generator inst4(Cin,g[0], g[1], g[2], g[3], p[0], p[1], p[2], p[3], G, P,c1,c2,c3,c4);


endmodule



////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////



module cla_16_bit(A,B,Cin,S,Carry, Cout,G,P);

input [15:0] A, B;
input Cin;
output wire [15:0] S;
output wire [15:0] Carry;
output wire G, P, Cout;
wire c1, c2, c3,c4;
wire carry1, carry2, carry3;
wire [3:0] gq, pq,g,p;

GP_Generator inst9(A[3:0], B[3:0], g[0], p[0]);
GP_Generator inst9(A[7:4], B[7:4], g[1], p[1]);
GP_Generator inst9(A[11:8], B[11:8], g[2], p[2]);
GP_Generator inst9(A[15:12], B[15:12], g[3], p[3]);

cla_4_bit inst0(A[3:0], B[3:0], Cin, S[3:0],Carry[3:0], carry1, gq[0], pq[0]);
cla_4_bit inst1(A[7:4], B[7:4], c1, S[7:4],Carry[7:4], carry2, gq[1], pq[1]);
cla_4_bit inst2(A[11:8], B[11:8], c2, S[11:8], Carry[11:8], carry3, gq[2], pq[2]);
cla_4_bit inst3(A[15:12], B[15:12], c3, S[15:12], Carry[15:12], Cout, gq[3], pq[3]);

block_cla_generator inst4(Cin,g[0], g[1], g[2], g[3], p[0], p[1], p[2], p[3], G, P,c1,c2,c3,c4);


endmodule

module GP_Generator(A,B,G,P);

input [3:0] A,B;
output wire G, P;

myExOR inst0(p[0],A[0],B[0]);
myExOR inst1(p[1],A[1],B[1]);
myExOR inst2(p[2],A[2],B[2]);
myExOR inst3(p[3],A[3],B[3]);

myAND2 inst4(g[0],A[0],B[0]);
myAND2 inst5(g[1],A[1],B[1]);
myAND2 inst6(g[2],A[2],B[2]);
myAND2 inst7(g[3],A[3],B[3]);

myAND4 inst8(P,p[0],p[1],p[2],p[3]);

wire t1,t2,t3;
myAND4 inst1(t1,p[3],p[2],p[1],g[0]);
myAND3 inst2(t2,p[3],p[2],g[1]);
myAND2 inst3(t3,p[3],g[2]);

myOR4 inst4(G,t1,t2,t3,g[3]);

endmodule


////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////

module block_cla_generator(Cin,g0,g4,g8,g12,p0,p4,p8,p12,G,P,c4,c8,c12,cout);

input g0,g4,g8,g12,p0,p4,p8,p12,Cin;
output wire G,P,c4,c8,c12,cout;

myAND4 inst0(P,p0,p4,p8,p12);

wire t1,t2,t3;
myAND4 inst1(t1,p4,p8,p12,g0);
myAND3 inst2(t2,p8,p12,g4);
myAND2 inst3(t3,p12,g8);

myOR4 inst4(G,t1,t2,t3,g12);


// c4 = g0 or Cin*p0

wire tempc4;
myOR2 inst5(c4,tempc4,g0);
myAND2 inst6(tempc4,Cin,p0);

// c8 = g4 or g0*p4 or Cin*p0*p4

wire [1:0] tempc8;
myOR3 inst7(c8,tempc8[0],tempc8[1],g4);
myAND2 inst8(tempc8[0],g0,p4);
myAND3 inst9(tempc8[1],Cin,p0,p4);

// c12 = g8 or g4*p8 or g0*p4*p8 or Cin*p0*p4*p8

wire [2:0] tempc12;
myOR4  inst10(c12,g8,tempc12[2],tempc12[1],tempc12[0]);
myAND4 inst11(tempc12[2],Cin,p0,p4,p8);
myAND3 inst12(tempc12[1],g0,p4,p8);
myAND2 inst13(tempc12[0],g4,p8);

wire tempcout
// cout = g12 or g4*p8*p12 or g0*p4*p8*p12 or Cin*p0*p4*p8*p12
myAND2 inst14(tempcout,P,Cin);
myOR2 inst15(cout,tempcout,G);
endmodule



////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////



module cla_4_bit(A,B,Cin,S,Carry,Cout,G,P);
input [3:0] A, B;
input Cin;
output wire Cout, G, P;
output wire [3:0] S;
output wire [3:0] Carry;

wire [3:0] g, p;
myExOR inst0(p[0],A[0],B[0]);
myExOR inst1(p[1],A[1],B[1]);
myExOR inst2(p[2],A[2],B[2]);
myExOR inst3(p[3],A[3],B[3]);

myAND2 inst4(g[0],A[0],B[0]);
myAND2 inst5(g[1],A[1],B[1]);
myAND2 inst6(g[2],A[2],B[2]);
myAND2 inst7(g[3],A[3],B[3]);

myAND4 inst18(P,p[0],p[1],p[2],p[3]);


wire Ctmp0,c1,c2,c3;
wire [1:0] Ctmp1;
wire [2:0] Ctmp2;
wire [3:0] Ctmp3;

myAND2 inst8(Ctmp0, p[0], Cin);

myAND2 inst9(Ctmp1[0],p[1],g[0]);
myAND3 inst10(Ctmp1[1],p[0],p[1],Cin);

myAND2 inst11(Ctmp2[0],p[2],g[1]);
myAND3 inst12(Ctmp2[1],p[2],p[1],g[0]);
myAND4 inst13(Ctmp2[2],p[0],p[1],p[2],Cin);

myAND2 inst14(Ctmp3[0],p[3],g[2]);
myAND3 inst15(Ctmp3[1],p[3],p[2],g[1]);
myAND4 inst16(Ctmp3[2],p[3],p[2],p[1],g[0]);
myAND5 inst17(Ctmp3[3],p[3],p[2],p[1],p[0],Cin);

myOR2 inst20(c1, Ctmp0, g[0]);
myOR3 inst21(c2,Ctmp1[0],Ctmp1[1],g[1]);
myOR4 inst22(c3,Ctmp2[0],Ctmp2[1],Ctmp2[2],g[2]);
myOR5 inst23(Cout,Ctmp3[0],Ctmp3[1],Ctmp3[2],Ctmp3[3],g[3]);

assign Carry[3:0] = {Cout, c3, c2, c1};

myExOR inst28(S[0],Cin,p[0]);
myExOR inst29(S[1],c1,p[1]);
myExOR inst30(S[2],c2,p[2]);
myExOR inst31(S[3],c3,p[3]);

myOR4 inst32(G,g[3],Ctmp3[0],Ctmp3[1],Ctmp3[2]);

endmodule


module testbench_cla_64_bit();

  reg [63:0] A, B;
  reg Cin;
  wire [63:0] S;
  wire [63:0] Carry;
  wire Cout;

  // Instantiate the CLA 64-bit adder
  cla_64_bit uut(A,B,Cin,S,Carry,Cout);

  // Clock generation
  reg clk = 0;
   always
     begin
    	#700 clk = ~clk;
  	 end


  initial 
    begin
      $dumpfile("wavedump.vcd");
      $dumpvars();
      $monitor("Time=%0t Sum=%b ", $time,  S);
      A = 64'b0000000000000000000000000000000000000000000000000000000000000000;
      B = 64'b1111111111111111111111111111111111111111111111111111111111111111;
      Cin = 1'b0;
      #500
      Cin = 1'b1;
      #1000
      A = 64'b0000000000000000000000000000000000000000000000000000000000000000;
      B = 64'b1111111111111111111111111111111111111111111111111111111111111111;
      Cin = 1'b0;
      #500
      A = 64'b0000000000000000000000000000000000000000000000000000000000000001;

      #1000
      $finish;
    end

endmodule

