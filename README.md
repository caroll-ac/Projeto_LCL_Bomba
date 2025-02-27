💣 PROJETO FINAL - Bomba Relógio ⏳

🚀 Desenvolvido por:
📌 Ana Caroline Evangelista da Silva
📌 João Vitor Ferreira Reis
📌 Ycaro Rodrigo Rocha Santana

🎓 Disciplina: Laboratório de Circuitos Lógicos (LCL)
👨‍🏫 Professor: Marcelo Grandi Mandelli
🏛️ Universidade de Brasília (UnB)
🛠️ Sobre o Projeto

Este projeto consiste na implementação de uma bomba relógio digital 💣⏳, desenvolvido como parte da disciplina de Circuitos Lógicos. O sistema foi modelado e simulado utilizando o Quartus II v.13.0, permitindo a descrição, simulação e configuração de circuitos digitais. A implementação física foi realizada em uma placa DE2, baseada na tecnologia FPGA.

O objetivo principal do projeto é aplicar os conhecimentos adquiridos sobre circuitos combinacionais e sequenciais, criando um sistema de segurança baseado em senha 🔐.
🎯 Objetivo

✔️ Implementar um sistema de proteção para um cofre que só pode ser aberto com a senha correta dentro de um tempo determinado.
✔️ Explorar circuitos digitais, combinacionais e sequenciais.
✔️ Simular um mecanismo de contagem regressiva ⏳.
✔️ Criar um desafio interativo, onde o usuário deve inserir a senha correta antes que o tempo acabe.
✔️ Caso o tempo se esgote sem a senha correta, um efeito visual será ativado, simulando uma explosão 💥.

⚙️ Funcionamento

🟢 Início:

    Pressione Start (KEY[0]) para iniciar o sistema.
    O usuário define uma senha secreta e um cronômetro regressivo começa a contagem de 4 minutos e 59 segundos.
    O tempo é exibido nos displays HEX0-HEX3.

🔢 Tentativa de Desbloqueio:

    O usuário insere a senha utilizando os switches SW[6:0] e confirma pressionando ENTER (KEY[3]).
    A senha digitada aparece no display HEX4.

🔴 Finalização:

    ✅ Senha correta: O cronômetro para, os LEDs verdes (LEDG) acendem e o cofre é aberto! 🎉
    ❌ Tempo esgotado: A bomba é ativada! Os LEDs vermelhos (LEDR) e os displays simulam uma explosão! 💥

🏗️ Estrutura do Sistema

🛠️ O projeto foi implementado utilizando três módulos principais:
🔹 Comparador de Senha – Verifica se a senha digitada corresponde à senha cadastrada.
🔹 Cronômetro Regressivo – Controla o tempo disponível para desbloqueio.
🔹 Gerador de Senha – Permite ao usuário definir a senha com antecedência.

📌 Tecnologias Utilizadas

🔹 Quartus II v.13.0 – Para modelagem e simulação do circuito.
🔹 Verilog – Para descrição do hardware digital.
🔹 Placa DE2 (FPGA) – Para a implementação física do sistema.
