#!/usr/bin/env bash
#
# main.sh - Gerência seus alias
#
# Autor:      Wiris Rafael Januario Wernek
# Manutenção: Wiris Rafael Januario Wernek
#
# ------------------------------------------------------------------------ #
#  Este programa irá criar, buscar, modificar e remover alias de uma forma simplificada
#
#  Exemplos:
#      $ ./main.sh -l
#      Neste exemplo todos os alias cadastrados pelo script serão listados 
#
# ------------------------------------------------------------------------ #
# Histórico:
#   v1.0 17/11/2021 Wiris
#      - Adicionado -h, -v, -r, -l, -s & -e
#
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 5.1.4
#   zsh  5.8
#
# ------------------------------------------------------------------------ #
#
# ------------------------------- VARIÁVEIS ----------------------------------------- #
MENSAGEM_USO="
    $(basename $0) - [OPÇÕES]

    -h - Menu de Ajuda
    -v - Exibe a Versão
    -r - Registra um novo alias.         Formato: -r ['comando'] ['alias'] ['descrição']      
    -l - Ler os alias cadastrados
    -s - Busca por um alias.             Formato: -s ['comando']
    -e - Editar os Alias Disponíveis
"
VERSAO="v1.0"

# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
case "$1" in
    -h) echo "$MENSAGEM_USO"                                                          		   ;;
    -v) echo "$VERSAO"                                                               		   ;;
    -r) echo '
    Comando: '"$2"' 
    Alias: '"$3"'
    Descrição: '"$4" >> ~/.malias/database && echo 'alias '"$3"'="'"$2"'"' >> ~/.malias/aliases;;
    -l) less ~/.malias/database &&                                                       	   ;;
    -s) cat ~/.malias/database | grep -A 2 "$2" &&                                       	   ;;
    -e) vim ~/.malias/database && vim ~/.malias/aliases                                        ;;
     *) echo "Opção Inválida"                                                                  ;;
esac

source ~/.malias/aliases
# ------------------------------------------------------------------------ #
