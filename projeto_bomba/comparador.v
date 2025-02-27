module comparador (
    input wire [6:0] tentativa,
    input wire [6:0] senha,
    input wire enter,
    output reg sinalvitoria,
    output reg start_comparador
);
    always @(posedge enter) begin
        if (tentativa == senha) begin
            sinalvitoria <= 1;
            start_comparador <= 0;
        end else begin
            sinalvitoria <= 0;
            start_comparador <= 1;
        end
    end
endmodule