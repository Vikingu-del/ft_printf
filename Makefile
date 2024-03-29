# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eseferi <eseferi@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/06 16:39:31 by eseferi           #+#    #+#              #
#    Updated: 2024/03/29 14:20:19 by eseferi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME       = libftprintf.a
CC         = gcc
CFLAGS     = -Wall -Wextra -Iinc -Isrc -O3 -g

RM         = rm -rf

# Directories
SRC_DIR    = src
OBJ_DIR    = obj
LIBFT_DIR  = lib/libft

# Source files
PRINTF_SRC = $(wildcard $(SRC_DIR)/*.c)
LIBFT_SRC  = $(wildcard $(LIBFT_DIR)/*.c)

# Object files
PRINTF_OBJ = $(PRINTF_SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
LIBFT_OBJ  = $(LIBFT_SRC:$(LIBFT_DIR)/%.c=$(OBJ_DIR)/%.o)

all: $(NAME)
	
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(PRINTF_OBJ) $(LIBFT_OBJ)
	@ar rcs $@ $^
	@echo "\033[1;32m[$(NAME)] Library created successfully.\033[0m"

clean:
	@$(RM) $(OBJ_DIR)
	@echo "\033[1;33m[$(NAME)] Object files deleted.\033[0m"

libft_fclean:
	@$(MAKE) -s -C $(LIBFT_DIR) fclean

fclean: clean libft_fclean
	@$(RM) $(NAME)
	@echo "\033[1;31m[$(NAME)] Library deleted.\033[0m"

re: fclean all

# Phony targets
.PHONY: all clean fclean re

.SILENT: