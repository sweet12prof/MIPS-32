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
extern void execute_901(char*, char *);
extern void execute_902(char*, char *);
extern void execute_20(char*, char *);
extern void execute_21(char*, char *);
extern void execute_22(char*, char *);
extern void execute_204(char*, char *);
extern void execute_395(char*, char *);
extern void execute_396(char*, char *);
extern void execute_397(char*, char *);
extern void execute_625(char*, char *);
extern void execute_626(char*, char *);
extern void execute_627(char*, char *);
extern void execute_628(char*, char *);
extern void execute_629(char*, char *);
extern void execute_630(char*, char *);
extern void execute_633(char*, char *);
extern void execute_634(char*, char *);
extern void execute_635(char*, char *);
extern void execute_846(char*, char *);
extern void execute_847(char*, char *);
extern void execute_848(char*, char *);
extern void execute_853(char*, char *);
extern void execute_854(char*, char *);
extern void execute_855(char*, char *);
extern void execute_856(char*, char *);
extern void execute_857(char*, char *);
extern void execute_858(char*, char *);
extern void execute_861(char*, char *);
extern void execute_862(char*, char *);
extern void execute_200(char*, char *);
extern void execute_201(char*, char *);
extern void execute_25(char*, char *);
extern void execute_66(char*, char *);
extern void execute_67(char*, char *);
extern void execute_27(char*, char *);
extern void execute_28(char*, char *);
extern void execute_29(char*, char *);
extern void execute_30(char*, char *);
extern void execute_203(char*, char *);
extern void execute_206(char*, char *);
extern void execute_208(char*, char *);
extern void execute_392(char*, char *);
extern void execute_394(char*, char *);
extern void execute_399(char*, char *);
extern void execute_400(char*, char *);
extern void execute_402(char*, char *);
extern void execute_406(char*, char *);
extern void execute_624(char*, char *);
extern void execute_461(char*, char *);
extern void execute_434(char*, char *);
extern void execute_411(char*, char *);
extern void execute_412(char*, char *);
extern void execute_413(char*, char *);
extern void execute_414(char*, char *);
extern void execute_415(char*, char *);
extern void execute_632(char*, char *);
extern void execute_829(char*, char *);
extern void execute_842(char*, char *);
extern void execute_843(char*, char *);
extern void execute_647(char*, char *);
extern void execute_831(char*, char *);
extern void execute_833(char*, char *);
extern void execute_835(char*, char *);
extern void execute_837(char*, char *);
extern void execute_839(char*, char *);
extern void execute_841(char*, char *);
extern void execute_845(char*, char *);
extern void execute_850(char*, char *);
extern void execute_860(char*, char *);
extern void execute_883(char*, char *);
extern void execute_884(char*, char *);
extern void execute_885(char*, char *);
extern void execute_886(char*, char *);
extern void execute_887(char*, char *);
extern void execute_888(char*, char *);
extern void execute_889(char*, char *);
extern void execute_890(char*, char *);
extern void execute_867(char*, char *);
extern void execute_868(char*, char *);
extern void execute_869(char*, char *);
extern void execute_870(char*, char *);
extern void execute_871(char*, char *);
extern void execute_872(char*, char *);
extern void execute_873(char*, char *);
extern void execute_874(char*, char *);
extern void execute_875(char*, char *);
extern void execute_876(char*, char *);
extern void execute_877(char*, char *);
extern void execute_879(char*, char *);
extern void execute_880(char*, char *);
extern void execute_881(char*, char *);
extern void execute_882(char*, char *);
extern void execute_892(char*, char *);
extern void execute_893(char*, char *);
extern void execute_894(char*, char *);
extern void execute_895(char*, char *);
extern void execute_896(char*, char *);
extern void execute_897(char*, char *);
extern void execute_898(char*, char *);
extern void execute_899(char*, char *);
extern void execute_900(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[103] = {(funcp)execute_901, (funcp)execute_902, (funcp)execute_20, (funcp)execute_21, (funcp)execute_22, (funcp)execute_204, (funcp)execute_395, (funcp)execute_396, (funcp)execute_397, (funcp)execute_625, (funcp)execute_626, (funcp)execute_627, (funcp)execute_628, (funcp)execute_629, (funcp)execute_630, (funcp)execute_633, (funcp)execute_634, (funcp)execute_635, (funcp)execute_846, (funcp)execute_847, (funcp)execute_848, (funcp)execute_853, (funcp)execute_854, (funcp)execute_855, (funcp)execute_856, (funcp)execute_857, (funcp)execute_858, (funcp)execute_861, (funcp)execute_862, (funcp)execute_200, (funcp)execute_201, (funcp)execute_25, (funcp)execute_66, (funcp)execute_67, (funcp)execute_27, (funcp)execute_28, (funcp)execute_29, (funcp)execute_30, (funcp)execute_203, (funcp)execute_206, (funcp)execute_208, (funcp)execute_392, (funcp)execute_394, (funcp)execute_399, (funcp)execute_400, (funcp)execute_402, (funcp)execute_406, (funcp)execute_624, (funcp)execute_461, (funcp)execute_434, (funcp)execute_411, (funcp)execute_412, (funcp)execute_413, (funcp)execute_414, (funcp)execute_415, (funcp)execute_632, (funcp)execute_829, (funcp)execute_842, (funcp)execute_843, (funcp)execute_647, (funcp)execute_831, (funcp)execute_833, (funcp)execute_835, (funcp)execute_837, (funcp)execute_839, (funcp)execute_841, (funcp)execute_845, (funcp)execute_850, (funcp)execute_860, (funcp)execute_883, (funcp)execute_884, (funcp)execute_885, (funcp)execute_886, (funcp)execute_887, (funcp)execute_888, (funcp)execute_889, (funcp)execute_890, (funcp)execute_867, (funcp)execute_868, (funcp)execute_869, (funcp)execute_870, (funcp)execute_871, (funcp)execute_872, (funcp)execute_873, (funcp)execute_874, (funcp)execute_875, (funcp)execute_876, (funcp)execute_877, (funcp)execute_879, (funcp)execute_880, (funcp)execute_881, (funcp)execute_882, (funcp)execute_892, (funcp)execute_893, (funcp)execute_894, (funcp)execute_895, (funcp)execute_896, (funcp)execute_897, (funcp)execute_898, (funcp)execute_899, (funcp)execute_900, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 103;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/pipeLinedProcessor_behav/xsim.reloc",  (void **)funcTab, 103);
	iki_vhdl_file_variable_register(dp + 129064);
	iki_vhdl_file_variable_register(dp + 129120);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/pipeLinedProcessor_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/pipeLinedProcessor_behav/xsim.reloc");

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
    iki_set_sv_type_file_path_name("xsim.dir/pipeLinedProcessor_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/pipeLinedProcessor_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/pipeLinedProcessor_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
