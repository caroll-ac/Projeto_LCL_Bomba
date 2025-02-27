module derrota (
    input wire clk_1Hz,        // Clock de 1Hz
    input wire sinalderrota,   // Entrada que ativa o efeito de derrota (1 = liga)
    output reg [6:0] HEX0,     // Display 0
    output reg [6:0] HEX1,     // Display 1
    output reg [6:0] HEX2,     // Display 2
    output reg [6:0] HEX3,     // Display 3
    output reg [6:0] HEX4,     // Display 4
    output reg [6:0] HEX5,     // Display 5
    output reg [6:0] HEX6,     // Display 6
    output reg [6:0] HEX7,     // Display 7
    output reg [17:0] LEDR     // LEDs vermelhos (0 a 17)
);

    reg toggle;  // Registrador para controlar o estado do piscar

    // Controle do toggle (inverte o estado a cada pulso de clock)
    always @(posedge clk_1Hz) begin
        if (sinalderrota) begin
            toggle <= ~toggle;  // Inverte o estado se "sinalderrota" for 1
        end else begin
            toggle <= 1'b0;      // Mantém desligado se "sinalderrota" for 0
        end
    end

    // Lógica para os displays e LEDs
    always @(*) begin
        if (sinalderrota && toggle) begin
            // Todos os displays mostram "8" (todos os segmentos acesos)
            HEX0 = 7'b0000000;  // Padrão para o dígito 8
            HEX1 = 7'b0000000;
            HEX2 = 7'b0000000;
            HEX3 = 7'b0000000;
            HEX4 = 7'b0000000;
            HEX5 = 7'b0000000;
            HEX6 = 7'b0000000;
            HEX7 = 7'b0000000;

            // Todos os LEDs vermelhos acesos (0 a 17)
            LEDR = 18'b111111111111111111;
        end else begin
            // Desliga todos os displays e LEDs
            HEX0 = 7'b1111111;  // Todos os segmentos apagados
            HEX1 = 7'b1111111;
            HEX2 = 7'b1111111;
            HEX3 = 7'b1111111;
            HEX4 = 7'b1111111;
            HEX5 = 7'b1111111;
            HEX6 = 7'b1111111;
            HEX7 = 7'b1111111;

            LEDR = 18'b000000000000000000;  // LEDs apagados
        end
    end

endmodule