`timescale 1ns / 1ps

module double_dabble(
        input A0,A1,A2,A3,A4,A5,A6,A7,
        output h3,h2,h1,h0, t3,t2,t1,t0, o3,o2,o1,o0
    );
    wire e0,f0,g0,z0;
    wire e1,f1,g1,z1;
    wire e2,f2,g2,z2;
    wire e3,f3,g3,z3;
    wire e4,f4,g4,z4;
    wire e5,f5,g5,z5;
    wire e6,f6,g6,z6;
    
    dabble U0(
        .A(1'b0),
        .B(A0),
        .C(A1),
        .D(A2),
        .E(e0),
        .F(f0),
        .G(g0),
        .H(z0)
    );
    
    dabble U1(
        .A(f0),
        .B(g0),
        .C(z0),
        .D(A3),
        .E(e1),
        .F(f1),
        .G(g1),
        .H(z1)
    );
    
    dabble U2(
        .A(f1),
        .B(g1),
        .C(z1),
        .D(A4),
        .E(e2),
        .F(f2),
        .G(g2),
        .H(z2)
    );
    
    dabble U3(
        .A(1'b0),
        .B(e0),
        .C(e1),
        .D(e2),
        .E(e3),
        .F(f3),
        .G(g3),
        .H(z3)
    );
    
    dabble U4(
        .A(f2),
        .B(g2),
        .C(z2),
        .D(A5),
        .E(e4),
        .F(f4),
        .G(g4),
        .H(z4)
    );
    dabble U5(
        .A(f3),
        .B(g3),
        .C(z3),
        .D(e4),
        .E(e5),
        .F(f5),
        .G(g5),
        .H(z5)
    );
    dabble U6(
        .A(f4),
        .B(g4),
        .C(z4),
        .D(A6),
        .E(e6),
        .F(f6),
        .G(g6),
        .H(z6)
    );
    
    assign h3 = 1'b0;
    assign h2 = 1'b0;
    assign h1 = e3;
    assign h0 = e5;
    
    assign t3 = f5;
    assign t2 = g5;
    assign t1 = z5;
    assign t0 = e6;
    
    assign o3 = f6;
    assign o2 = g6;
    assign o1 = z6;
    assign o0 = A7;
endmodule
