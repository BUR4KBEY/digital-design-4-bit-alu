`timescale 1ns / 1ps


module alu_design_project(
        input screen1,screen0,
        input opcode2, opcode1, opcode0,
        input A3,A2,A1,A0,
        input B3,B2,B1,B0,
        input carry_in,
        
        output carry_out_output,
        output overflow,
        output h3,h2,h1,h0,
        output o3,o2,o1,o0,
        output t3,t2,t1,t0,
        output error
    );
    wire dec2_y0, dec2_y1, dec2_y2, dec2_y3;
    
    decoder_2x4 U0(
        .A1(screen1),
        .A0(screen0),
        .Y0(dec2_y0),
        .Y1(dec2_y1),
        .Y2(dec2_y2),
        .Y3(dec2_y3)
    );
    wire dec_3[7:0];
    decoder_3x8 U1(
        .C(opcode0),
        .B(opcode1),
        .A(opcode2),
        .Y0(dec_3[0]),
        .Y1(dec_3[1]),
        .Y2(dec_3[2]),
        .Y3(dec_3[3]),
        .Y4(dec_3[4]),
        .Y5(dec_3[5]),
        .Y6(dec_3[6]),
        .Y7(dec_3[7])
    );
    wire and_block[0:5];
    
    assign and_block[0] = dec2_y3 & dec_3[0];
    assign and_block[1] = dec2_y3 & dec_3[1];
    assign and_block[2] = dec2_y3 & dec_3[2];
    assign and_block[3] = dec2_y3 & dec_3[3];
    assign and_block[4] = dec2_y3 & dec_3[4];
    assign and_block[5] = dec2_y3 & dec_3[5];
    
    wire tri_opcode[2:0];
    tristate_buffer U2(
        .A(opcode2),
        .EN(dec2_y0),
        .Y(tri_opcode[0])
    );
    
    tristate_buffer U3(
        .A(opcode1),
        .EN(dec2_y0),
        .Y(tri_opcode[1])
    );
    
    tristate_buffer U4(
        .A(opcode0),
        .EN(dec2_y0),
        .Y(tri_opcode[2])
    );
    
    wire tri_inpA[3:0];
    
    tristate_buffer U5(
        .A(A3),
        .EN(dec2_y1),
        .Y(tri_inpA[0])
    );
    
    tristate_buffer U6(
       .A(A2),
       .EN(dec2_y1),
       .Y(tri_inpA[1])
    );
    
    tristate_buffer U7(
       .A(A1),
       .EN(dec2_y1),
       .Y(tri_inpA[2])
    );
    
    tristate_buffer U8(
       .A(A0),
       .EN(dec2_y1),
       .Y(tri_inpA[3])
    );
    
    wire tri_inpB[3:0];
    
    tristate_buffer U9(
       .A(B3),
       .EN(dec2_y2),
       .Y(tri_inpB[0])
    );
    tristate_buffer U10(
       .A(B2),
       .EN(dec2_y2),
       .Y(tri_inpB[1])
    );
    tristate_buffer U11(
       .A(B1),
       .EN(dec2_y2),
       .Y(tri_inpB[2])
    );
    tristate_buffer U12(
       .A(B0),
       .EN(dec2_y2),
       .Y(tri_inpB[3])
    );
    wire sum[3:0];
    wire carry_out_wire;
    four_bit_adder U13(
        .A0(A0),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        
        .B0(B0),
        .B1(B1),
        .B2(B2),
        .B3(B3),
        
        .Cin(carry_in),
        
        .Sum0(sum[0]),
        .Sum1(sum[1]),
        .Sum2(sum[2]),
        .Sum3(sum[3]),
        
        .Cout(carry_out_wire),
        
        .Enable(and_block[0])
    );
    
    wire diff[3:0];
    wire barrow_out;
    
    four_bit_subs U14(
        .A0(A0),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        
        .B0(B0),
        .B1(B1),
        .B2(B2),
        .B3(B3),
        
        .Bin(carry_in),
        
        .Enable(and_block[1]),
        
        .Diff0(diff[0]),
        .Diff1(diff[1]),
        .Diff2(diff[2]),
        .Diff3(diff[3]),
        
        .Bout(barrow_out)
    );
    
    wire product[7:0];
    
    four_bit_multiplier U15(
        .A0(A0),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        
        .B0(B0),
        .B1(B1),
        .B2(B2),
        .B3(B3),
        
        .enable(and_block[2]),
        
        .Y0(product[0]),
        .Y1(product[1]),
        .Y2(product[2]),
        .Y3(product[3]),
        .Y4(product[4]),
        .Y5(product[5]),
        .Y6(product[6]),
        .Y7(product[7])
    );
    
    wire and_result[3:0];
    four_bit_and U16(
        .A0(A0),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        
        .B0(B0),
        .B1(B1),
        .B2(B2),
        .B3(B3),
        
        .enable(and_block[3]),
        
        .Y0(and_result[0]),
        .Y1(and_result[1]),
        .Y2(and_result[2]),
        .Y3(and_result[3])
    );
    
    wire or_result[3:0];
    four_bit_or U17(
        .A0(A0),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        
        .B0(B0),
        .B1(B1),
        .B2(B2),
        .B3(B3),
        
        .enable(and_block[4]),
        
        .Y0(or_result[0]),
        .Y1(or_result[1]),
        .Y2(or_result[2]),
        .Y3(or_result[3])
    );
    
    wire xor_result[3:0];
    four_bit_xor U18(
        .A0(A0),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        
        .B0(B0),
        .B1(B1),
        .B2(B2),
        .B3(B3),
        
        .enable(and_block[5]),
        
        .Y0(xor_result[0]),
        .Y1(xor_result[1]),
        .Y2(xor_result[2]),
        .Y3(xor_result[3])
    );
    
    double_dabble U19(
        .A7(xor_result[0] | or_result[0] | and_result[0] | product[0] | diff[0] | sum[0] | tri_opcode[2] | tri_inpA[3] | tri_inpB[3]),
        .A6(xor_result[1] | or_result[1] | and_result[1] | product[1] | diff[1] | sum[1] | tri_opcode[1] | tri_inpA[2] | tri_inpB[2]),
        .A5(xor_result[2] | or_result[2] | and_result[2] | product[2] | diff[2] | sum[2] | tri_opcode[0] | tri_inpA[1] | tri_inpB[1]),
        .A4(xor_result[3] | or_result[3] | and_result[3] | product[3] | diff[3] | sum[3] | tri_inpA[0] | tri_inpB[0]),
        .A3(product[4]),
        .A2(product[5]),
        .A1(product[6]),
        .A0(product[7]),
        
        .h3(h3),
        .h2(h2),
        .h1(h1),
        .h0(h0),
        
        .t3(t3),
        .t2(t2),
        .t1(t1),
        .t0(t0),
        
        .o3(o3),
        .o2(o2),
        .o1(o1),
        .o0(o0)
    );
    
    assign error = dec_3[6] | dec_3[7];
    assign carry_out_output =  (and_block[0] ? carry_out_wire : 1'b0) | (and_block[1] ? barrow_out : 1'b0);
    assign overflow = and_block[0] & (carry_out_wire);
    
endmodule
