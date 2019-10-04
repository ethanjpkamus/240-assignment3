//Author: Ethan Kamus
//Email: ethanjpkamus@csu.fullerton.edu

/* The purpose of this assignment is to learn how to code in x86-64 assembly
 * by conducting simple math with integers and returning a number to a driver
 * module.
 */

#include <stdio.h>
#include <iostream>

extern "C" long assignment3();

int main(){
	long pass;
	std::cout << "\nWelcome to Assignment 3\n\n";
	std::cout << "This was made by Ethan Kamus\n";

 	pass = assignment3();

	std::cout << "\nThe driver recieved " << pass << " from the assembly\n"
	     << "The Main function will now return 0\n"
	     << "Bye\n";

	return 0;
}
