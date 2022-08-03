/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_lib.strllen.cpp                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rgeny <rgeny@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/03 11:04:10 by rgeny             #+#    #+#             */
/*   Updated: 2022/08/03 11:24:21 by rgeny            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "fnx.hpp"

#ifdef FNX_TEST
void	fnx_test::strllen	(char ** argv,
							 char ** envp)
{
	print_category("strllen");
	std::cout	<< "fnx::strllen(argv) : "
				<< fnx::strllen(argv)
				<< std::endl

				<< "fnx::strllen(envp) : "
				<< fnx::strllen(envp)
				<< std::endl

				<< "fnx::strllen(NULL) : "
				<< fnx::strllen(NULL)
				<< std::endl;

}
#endif
