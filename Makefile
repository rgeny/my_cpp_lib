# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgeny <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/23 14:20:33 by rgeny             #+#    #+#              #
#    Updated: 2022/08/08 14:09:21 by rgeny            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NEW_DIR				= mkdir -p
DEL_DIR				= rm -rf

CC					= clang++
VALGRIND			= valgrind
COMPILE_FLAG		= $(DEPS_FLAG) -Wall -Werror -Wextra -g -std=c++20
COMPILE_EXE_FLAG	= $(COMPILE_FLAG) -D FNX_TEST=42
DEPS_FLAG			= -MMD -MP
INCLUDES_FLAG		= $(addprefix -I,	$(INCLUDES_DIR) \
										$(CLASS_DIR) \
										$(DEFINES_DIR) \
										$(FUNCTIONS_DIR) \
										$(TEMPLATES_DIR))

INCLUDES_DIR		= includes/
CLASS_DIR			= $(INCLUDES_DIR)class/
DEFINES_DIR			= $(INCLUDES_DIR)defines/
FUNCTIONS_DIR		= $(INCLUDES_DIR)functions/
TEMPLATES_DIR		= $(INCLUDES_DIR)templates/
OBJS_DIR			= objs/
OBJS_EXE_DIR		= objs_exe/
SRCS_DIR			= srcs/
FNX_TEST_DIR		= $(SRCS_DIR)fnx_test/
STR_DIR				= $(SRCS_DIR)str/
EXCEPTIONS_DIR		= $(SRCS_DIR)exceptions/
PRINT_DIR			= $(SRCS_DIR)print/
NOTCASESTRING_DIR	= $(SRCS_DIR)NotCaseString/
WILDCARDSTRING_DIR	= $(SRCS_DIR)WildcardString/
STD_DIR				= $(SRCS_DIR)std/

VPATH				= $(SRCS_DIR) $(FNX_TEST_DIR)
VPATH				+=$(STR_DIR)
VPATH				+=$(EXCEPTIONS_DIR)
VPATH				+=$(PRINT_DIR)
VPATH				+=$(NOTCASESTRING_DIR)
VPATH				+=$(WILDCARDSTRING_DIR)
VPATH				+=$(STD_DIR)


DEFAULT_FILES		= operator structor member accessor
SRCS				= $(addsuffix .cpp,					main \
						$(addprefix fnx_test.,			test \
														trio \
														ptpt_to_vector \
														strllen \
														vsplit \
														vjoin \
														chronometer \
														vector \
														itoa \
														NotCaseString \
														WildcardString \
														replace_substr \
														get_list) \
														\
														strllen \
														split \
														join \
														replace_substr \
														\
														wrong_number_of_arguments \
														wrong_parameters \
														error \
														wildcardstring_same_wildcard_char \
														\
						$(addprefix NotCaseString.,		$(DEFAULT_FILES) \
														find_last_of \
														compare \
														init_case_off \
														find \
														find_first_not_of \
														find_first_of \
														find_last_not_of \
														rfind) \
														\
						$(addprefix WildcardString.,	$(DEFAULT_FILES)) \
														\
														filesystem \
														get_list)
MAIN				= srcs/main.cpp
OBJS				= $(patsubst %.cpp, $(OBJS_DIR)%.o, $(SRCS))
DEPS				= $(OBJS:.o=.d)

LIB					= fnxlib.a
EXE					= fnxlib.out

all					: $(OBJS_DIR) $(LIB)

$(OBJS_DIR)			:
					$(NEW_DIR) $@

exe					:
					make OBJS_DIR=$(OBJS_EXE_DIR) LIB="$(EXE)" COMPILE_FLAG="$(COMPILE_EXE_FLAG)"

$(LIB)				: $(OBJS)
ifneq ($(LIB), $(EXE))
					ar -rc $@ $^
					ranlib $@
else
					$(CC) $(COMPILE_EXE_FLAG) $(OBJS) -o $(EXE)
endif

$(OBJS_DIR)%.o		: %.cpp
					$(CC) $(COMPILE_FLAG) -c $< $(INCLUDES_FLAG) -o $@

clean				:
					$(DEL_DIR) $(OBJS_DIR) $(OBJS_EXE_DIR)

fclean				: clean
					$(DEL_DIR) $(LIB) $(EXE)

re					: fclean all

-include			$(DEPS)

.PHONY				: all clean fclean re valgrind exe

