module ForwardingUnit_tb;
    // Definición de señales
    logic [4:0] rs1_ex;
    logic [4:0] rs2_ex;
    logic [4:0] rd_me;
    logic RUWr_me;
    logic RUWr_wb;
    logic [4:0] rd_wb;
    logic [1:0] FUASrc;
    logic [1:0] FUBSrc;

    // Instancia del módulo bajo prueba (DUT)
    ForwardingUnit DUT (
        .rs1_ex(rs1_ex),
        .rs2_ex(rs2_ex),
        .rd_me(rd_me),
        .RUWr_me(RUWr_me),
        .RUWr_wb(RUWr_wb),
        .rd_wb(rd_wb),
        .FUASrc(FUASrc),
        .FUBSrc(FUBSrc)
    );

    // Procedimiento inicial de simulación
    initial begin
        // Abrir archivo .vcd
        $dumpfile("ForwardingUnit_tb.vcd");
        $dumpvars(0, ForwardingUnit_tb);

        // Caso 1: RUWr_me activo y coincidencia de rs1_ex con rd_me
        rs1_ex = 5'd8;
        rs2_ex = 5'd10;
        rd_me = 5'd8;
        RUWr_me = 1;
        RUWr_wb = 1;
        rd_wb = 5'd0;
        #10;
        $display("Caso 1 - FUASrc: %b, FUBSrc: %b", FUASrc, FUBSrc);

        // Caso 2: RUWr_me activo y coincidencia de rs2_ex con rd_me
        rs1_ex = 5'd2;
        rs2_ex = 5'd8;
        rd_me = 5'd8;
        RUWr_me = 1;
        RUWr_wb = 0;
        rd_wb = 5'd0;
        #10;
        $display("Caso 2 - FUASrc: %b, FUBSrc: %b", FUASrc, FUBSrc);

        // Caso 3: RUWr_wb activo y coincidencia de rs1_ex con rd_wb
        rs1_ex = 5'd4;
        rs2_ex = 5'd5;
        rd_me = 5'd0;
        RUWr_me = 1;
        RUWr_wb = 1;
        rd_wb = 5'd4;
        #10;
        $display("Caso 3 - FUASrc: %b, FUBSrc: %b", FUASrc, FUBSrc);

        // Caso 4: RUWr_wb activo y coincidencia de rs2_ex con rd_wb
        rs1_ex = 5'd4;
        rs2_ex = 5'd3;
        rd_me = 5'd0;
        RUWr_me = 0;
        RUWr_wb = 1;
        rd_wb = 5'd3;
        #10;
        $display("Caso 4 - FUASrc: %b, FUBSrc: %b", FUASrc, FUBSrc);

        // Caso 5: Sin coincidencias
        rs1_ex = 5'd5;
        rs2_ex = 5'd6;
        rd_me = 5'd7;
        RUWr_me = 0;
        RUWr_wb = 0;
        rd_wb = 5'd8;
        #10;
        $display("Caso 5 - FUASrc: %b, FUBSrc: %b", FUASrc, FUBSrc);

        // Finalizar simulación
        $finish;
    end

endmodule
