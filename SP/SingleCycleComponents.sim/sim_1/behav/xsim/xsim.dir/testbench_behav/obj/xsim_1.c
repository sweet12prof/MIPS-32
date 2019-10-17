/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_613(char*, char *);
extern void execute_614(char*, char *);
extern void execute_615(char*, char *);
extern void execute_33(char*, char *);
extern void execute_22(char*, char *);
extern void execute_23(char*, char *);
extern void execute_24(char*, char *);
extern void execute_25(char*, char *);
extern void execute_26(char*, char *);
extern void execute_27(char*, char *);
extern void execute_28(char*, char *);
extern void execute_29(char*, char *);
extern void execute_30(char*, char *);
extern void execute_32(char*, char *);
extern void execute_35(char*, char *);
extern void execute_38(char*, char *);
extern void execute_216(char*, char *);
extern void execute_217(char*, char *);
extern void execute_41(char*, char *);
extern void execute_82(char*, char *);
extern void execute_83(char*, char *);
extern void execute_43(char*, char *);
extern void execute_44(char*, char *);
extern void execute_45(char*, char *);
extern void execute_46(char*, char *);
extern void execute_219(char*, char *);
extern void execute_221(char*, char *);
extern void execute_402(char*, char *);
extern void execute_406(char*, char *);
extern void execute_407(char*, char *);
extern void execute_409(char*, char *);
extern void execute_598(char*, char *);
extern void execute_605(char*, char *);
extern void execute_606(char*, char *);
extern void execute_416(char*, char *);
extern void execute_600(char*, char *);
extern void execute_602(char*, char *);
extern void execute_604(char*, char *);
extern void execute_608(char*, char *);
extern void execute_609(char*, char *);
extern void execute_611(char*, char *);
extern void execute_612(char*, char *);
extern void transaction_2(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[44] = {(funcp)execute_613, (funcp)execute_614, (funcp)execute_615, (funcp)execute_33, (funcp)execute_22, (funcp)execute_23, (funcp)execute_24, (funcp)execute_25, (funcp)execute_26, (funcp)execute_27, (funcp)execute_28, (funcp)execute_29, (funcp)execute_30, (funcp)execute_32, (funcp)execute_35, (funcp)execute_38, (funcp)execute_216, (funcp)execute_217, (funcp)execute_41, (funcp)execute_82, (funcp)execute_83, (funcp)execute_43, (funcp)execute_44, (funcp)execute_45, (funcp)execute_46, (funcp)execute_219, (funcp)execute_221, (funcp)execute_402, (funcp)execute_406, (funcp)execute_407, (funcp)execute_409, (funcp)execute_598, (funcp)execute_605, (funcp)execute_606, (funcp)execute_416, (funcp)execute_600, (funcp)execute_602, (funcp)execute_604, (funcp)execute_608, (funcp)execute_609, (funcp)execute_611, (funcp)execute_612, (funcp)transaction_2, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 44;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/testbench_behav/xsim.reloc",  (void **)funcTab, 44);
	iki_vhdl_file_variable_register(dp + 75808);
	iki_vhdl_file_variable_register(dp + 75864);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/testbench_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/testbench_behav/xsim.reloc");

	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/testbench_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/testbench_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/testbench_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
