// ============================================================================
// Author: 	Loic Delineau
// Date:   	XX/XX/2024
// File:	shell.c
// Licence:	GPLv3
//
// Abstract:	Program to read joystick inputs and display to terminal
// Description: ...
//		...
//		...
//
// Compilation:	$ gcc shell.c -o shell
// Execution: 	$ ./shell
// ============================================================================

// LIBRARIES ===================================================================
#include <stdio.h>

// DATA TYPES ==================================================================
struct e {
	int a;
};

// PROTOTYPES ==================================================================
int foo(int p);

// MAIN ========================================================================
int main(int argc, const char *argv[])
{
	// Print number of arguments 
	printf("argc = %i\n",argc);

	// Print strings passed as arguments to program
	int tmp = argc;
	int i = 0;
	while (tmp >= 1)
	{
		tmp -= 1;
		printf("argv[%i] = %s \n",i,argv[i]);
		++i;
	}
	
	return 0;
}

// DEFINITIONS =================================================================
int foo(int p)
{
	return p;
}

