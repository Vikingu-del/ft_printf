# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eseferi <eseferi@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/06 16:39:31 by eseferi           #+#    #+#              #
#    Updated: 2024/04/04 12:55:00 by eseferi          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME       = libftprintf.a
LIBFT_DIR  = lib/libft

CC         = gcc
CFLAGS     = -Wall -Wextra -Iinc -Isrc -O3 -g

RM         = rm -rf

# Directories
SRC_DIR    = src
OBJ_DIR    = obj

# Source files
PRINTF_SRC = $(wildcard $(SRC_DIR)/*.c)
LIBFT_SRC  = $(wildcard $(LIBFT_DIR)/*.c)

# Object files
PRINTF_OBJ = $(PRINTF_SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
LIBFT_OBJ  = $(LIBFT_SRC:$(LIBFT_DIR)/%.c=$(OBJ_DIR)/%.o)

all: $(NAME)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(@D)
	@$(CC) $(CFLAGS) -c $< -o $@

$(LIBFT_DIR)/libft.a:
	@$(MAKE) -s -C $(LIBFT_DIR)

$(NAME): $(PRINTF_OBJ) $(LIBFT_DIR)/libft.a
	@ar rcs $@ $(PRINTF_OBJ)
	@echo "\033[1;32m[$(NAME)] Library created successfully.\033[0m"

clean:
	@$(RM) $(OBJ_DIR)
	@$(MAKE) -s -C $(LIBFT_DIR) clean
	@echo "\033[1;33m[$(NAME)] Object files deleted.\033[0m"

fclean: clean
	@$(RM) $(NAME)
	@$(MAKE) -s -C $(LIBFT_DIR) fclean
	@echo "\033[1;31m[$(NAME)] Library deleted.\033[0m"

re: fclean all

# Phony targets
.PHONY: all clean fclean re
