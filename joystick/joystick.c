// =============================================================================
// Author: 	Loic Delineau
// Date:   	02/08/2024
// File:	joystick.c
// Licence:	GPLv3
//
// Abstract:	Program to read joystick inputs and display to terminal
// Description: ...
//		...
//		...
//
// Compilation:	$ gcc joystick.c -o joystick
// Execution: 	$ ./joystick
//
// Relevant Documentation:
// https://www.kernel.org/doc/Documentation/input/joystick-api.txt
// =============================================================================

// LIBRARIES ===================================================================
#include <stdio.h> 	// for standard i/o
#include <asm/types.h>  // for data types in js_event struct
#include <fcntl.h>	// File control options to access system calls

//#include <unistd.h> 	// POSIX API
			
// DATA TYPES ==================================================================
struct js_event {
	__u32 time;     /* event timestamp in milliseconds */
	__s16 value;    /* value */
	__u8 type;      /* event type */
	__u8 number;    /* axis/button number */
};

// PROTOTYPES ==================================================================
void display(struct js_event e);

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
	
	// Opening event file of our joystick & giving it the fd handle
	int fd = open ("/dev/input/js0", O_RDONLY);

	// Instanciating our joystick event data type
	struct js_event e;

	while (1) {
		read (fd, &e, sizeof(e));
		display (e);	
	};

	return 0;
}

// DEFINITIONS =================================================================
void display(struct js_event e)
{
	printf("time = %i\n", e.time);
	printf("value = %i\n", e.value);
	printf("type = %i\n", e.type);
	printf("number = %i\n", e.number);
}

