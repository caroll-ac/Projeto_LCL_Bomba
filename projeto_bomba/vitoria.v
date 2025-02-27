module vitoria (
    input wire sinalvitoria,
    output reg [8:0] LEDG,
    output reg congelardisplays
);
    always @(*) begin
        if (sinalvitoria) begin
            LEDG <= 9'b111111111;
            congelardisplays <= 1;
        end else begin
            LEDG <= 9'b000000000;
            congelardisplays <= 0;
        end
    end
endmodule