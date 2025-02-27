module geradordicas (
    input wire CLOCK_50,
    input wire reset,
    input wire [6:0] attempt,
    input wire [6:0] password,
    output reg [6:0] hint
);
    wire [6:0] random_number;
    reg [1:0] operation; // 2 bits para selecionar entre 4 operações

    // Instancia o LFSR
    lfsr lfsr_inst (
        .CLOCK_50(CLOCK_50),
        .reset(reset),
        .random_number(random_number)
    );

    // Gera uma operação aleatória sempre que a tentativa muda
    always @(posedge CLOCK_50 or posedge reset) begin
        if (reset) begin
            operation <= 2'b00; // Reinicia a operação
        end else begin
            operation <= random_number[1:0]; // Usa os 2 bits menos significativos do LFSR
        end
    end

    // Gera a dica com base na operação selecionada
    always @(*) begin
        case (operation)
            2'b00: hint <= attempt ^ password; // XOR
            2'b01: hint <= attempt & password; // AND
            2'b10: hint <= attempt | password; // OR
            2'b11: hint <= ~attempt; // NOT (inverte a tentativa)
            default: hint <= 7'b0000000;
        endcase
    end
endmodule

// Definindo o módulo lfsr
module lfsr (
    input wire CLOCK_50,
    input wire reset,
    output reg [6:0] random_number
);
    reg [6:0] lfsr_reg; // Registro do LFSR
    wire feedback;

    // Defina o feedback do LFSR (depende do tipo de LFSR)
    assign feedback = lfsr_reg[6] ^ lfsr_reg[5]; // Exemplo de feedback simples

    always @(posedge CLOCK_50 or posedge reset) begin
        if (reset) begin
            lfsr_reg <= 7'b1111111; // Valor inicial (seed)
        end else begin
            lfsr_reg <= {lfsr_reg[5:0], feedback}; // Shift e feedback
        end
    end

    // Atribui o número aleatório gerado
    always @(*) begin
        random_number = lfsr_reg;
    end
endmodule
