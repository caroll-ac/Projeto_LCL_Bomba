module geradorsenhas (
    input clk_1Hz,
    input reset,
    output reg [6:0] senha
);

  reg [10:0] lfsr;
  parameter LFSR_INIT = 11'b10101010101;
  parameter TAP_BIT = 10;
  parameter TAP_BIT2 = 8;
  reg gerada;

  always @(posedge clk_1Hz or posedge reset) begin
    if (reset) begin
      lfsr <= LFSR_INIT;
      gerada <= 0;
    end else if (!gerada) begin
      lfsr <= {lfsr[9:0], lfsr[TAP_BIT] ^ lfsr[TAP_BIT2]};
      gerada <= 1;
    end
  end
  
  always @(*) begin
    senha = lfsr[6:0];
  end

endmodule
