module contador (
    input wire clk_1Hz,
    input wire start,
    input wire sinalvitoria,
    output reg [3:0] minutos,
    output reg [3:0] segundos_dez,
    output reg [3:0] segundos_unidade,
    output reg [3:0] decimos,
    output reg sinalderrota
);
    reg [3:0] contador_minutos;
    reg [3:0] contador_segundos_dez;
    reg [3:0] contador_segundos_unidade;
    reg [3:0] contador_decimos;
    reg rodando;

    // Controla o contador na borda de descida do sinal start
    always @(negedge start or posedge clk_1Hz) begin
        if (!start) begin
            // Inicializa o contador com 4:59.9 na borda de descida do start
            contador_minutos <= 4;
            contador_segundos_dez <= 5;
            contador_segundos_unidade <= 9;
            contador_decimos <= 9;
            rodando <= 1;
            sinalderrota <= 0;
        end else if (rodando && !sinalvitoria) begin
            // Contagem decrescente
            if (contador_decimos > 0) begin
                contador_decimos <= contador_decimos - 1;
            end else begin
                contador_decimos <= 9;
                if (contador_segundos_unidade > 0) begin
                    contador_segundos_unidade <= contador_segundos_unidade - 1;
                end else begin
                    contador_segundos_unidade <= 9;
                    if (contador_segundos_dez > 0) begin
                        contador_segundos_dez <= contador_segundos_dez - 1;
                    end else begin
                        contador_segundos_dez <= 5;
                        if (contador_minutos > 0) begin
                            contador_minutos <= contador_minutos - 1;
                        end else begin
                            // Tempo esgotado: dispara derrota
                            rodando <= 0;
                            sinalderrota <= 1;
                        end
                    end
                end
            end
        end
    end

    // Atualiza as saídas a cada ciclo do clock
    always @(posedge clk_1Hz) begin
        minutos <= contador_minutos;
        segundos_dez <= contador_segundos_dez;
        segundos_unidade <= contador_segundos_unidade;
        decimos <= contador_decimos;
    end
endmodule
