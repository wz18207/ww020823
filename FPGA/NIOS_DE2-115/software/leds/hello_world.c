/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */
#include "sys/alt_stdio.h"
#include "sys/unistd.h"
#include "altera_avalon_pio_regs.h"
#include "system.h"
int main(void)
{

  printf("Hello from Nios II!\n");
  int sw = 0;
  int count = 0;
  while (1)
  {
	  sw = IORD_ALTERA_AVALON_PIO_DATA(SW_BASE);
	  IOWR_ALTERA_AVALON_PIO_DATA(LEDR_BASE, sw);
	  IOWR_ALTERA_AVALON_PIO_DATA(LEDG_BASE, count);
	  usleep(100000);
	  count++;
  }
  return 0;
}
