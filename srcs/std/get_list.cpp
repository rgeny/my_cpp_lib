/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_list.cpp                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rgeny <rgeny@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/04 16:09:57 by rgeny             #+#    #+#             */
/*   Updated: 2022/08/22 11:50:12 by rgeny            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "fnx.hpp"

std::vector<fnx::WildcardString>	fnx::get_files	(fs::path path,
													 fnx::vector<fnx::WildcardString>	ign_list)
{
	std::vector<fnx::WildcardString>	to_return;
	std::filesystem::directory_entry	dir(path);

	fs::recursive_directory_iterator	it(dir);
	while (it != fs::end(it))
	{
		if (it->is_regular_file() &&
			ign_list.find_first_occ(it->path().filename().c_str()) == ign_list.end())
		{
			to_return.push_back(it->path().c_str());
		}
		it++;
	}
	return (to_return);
}

std::vector<fnx::WildcardString>	fnx::get_dirs	(fs::path path,
													 fnx::vector<fnx::WildcardString>	ign_list)
{
	std::vector<fnx::WildcardString>	to_return;
	std::filesystem::directory_entry	dir(path);

	fs::recursive_directory_iterator	it(dir);
	while (it != fs::end(it))
	{
		if (it->is_directory() &&
			ign_list.find_first_occ(it->path().filename().c_str()) == ign_list.end())
		{
			to_return.push_back(it->path().c_str());
		}
		it++;
	}
	return (to_return);
}
