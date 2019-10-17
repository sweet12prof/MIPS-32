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
extern void execute_913(char*, char *);
extern void execute_914(char*, char *);
extern void execute_915(char*, char *);
extern void execute_906(char*, char *);
extern void execute_907(char*, char *);
extern void execute_23(char*, char *);
extern void execute_24(char*, char *);
extern void execute_25(char*, char *);
extern void execute_26(char*, char *);
extern void execute_208(char*, char *);
extern void execute_400(char*, char *);
extern void execute_401(char*, char *);
extern void execute_402(char*, char *);
extern void execute_630(char*, char *);
extern void execute_631(char*, char *);
extern void execute_632(char*, char *);
extern void execute_633(char*, char *);
extern void execute_634(char*, char *);
extern void execute_635(char*, char *);
extern void execute_638(char*, char *);
extern void execute_639(char*, char *);
extern void execute_640(char*, char *);
extern void execute_851(char*, char *);
extern void execute_852(char*, char *);
extern void execute_853(char*, char *);
extern void execute_858(char*, char *);
extern void execute_859(char*, char *);
extern void execute_860(char*, char *);
extern void execute_861(char*, char *);
extern void execute_862(char*, char *);
extern void execute_863(char*, char *);
extern void execute_866(char*, char *);
extern void execute_867(char*, char *);
extern void execute_204(char*, char *);
extern void execute_205(char*, char *);
extern void execute_29(char*, char *);
extern void execute_70(char*, char *);
extern void execute_71(char*, char *);
extern void execute_31(char*, char *);
extern void execute_32(char*, char *);
extern void execute_33(char*, char *);
extern void execute_34(char*, char *);
extern void execute_207(char*, char *);
extern void execute_210(char*, char *);
extern void execute_212(char*, char *);
extern void execute_397(char*, char *);
extern void execute_399(char*, char *);
extern void execute_404(char*, char *);
extern void execute_405(char*, char *);
extern void execute_407(char*, char *);
extern void execute_411(char*, char *);
extern void execute_629(char*, char *);
extern void execute_466(char*, char *);
extern void execute_439(char*, char *);
extern void execute_416(char*, char *);
extern void execute_417(char*, char *);
extern void execute_418(char*, char *);
extern void execute_419(char*, char *);
extern void execute_420(char*, char *);
extern void execute_637(char*, char *);
extern void execute_834(char*, char *);
extern void execute_847(char*, char *);
extern void execute_848(char*, char *);
extern void execute_652(char*, char *);
extern void execute_836(char*, char *);
extern void execute_838(char*, char *);
extern void execute_840(char*, char *);
extern void execute_842(char*, char *);
extern void execute_844(char*, char *);
extern void execute_846(char*, char *);
extern void execute_850(char*, char *);
extern void execute_855(char*, char *);
extern void execute_865(char*, char *);
extern void execute_888(char*, char *);
extern void execute_889(char*, char *);
extern void execute_890(char*, char *);
extern void execute_891(char*, char *);
extern void execute_892(char*, char *);
extern void execute_893(char*, char *);
extern void execute_894(char*, char *);
extern void execute_895(char*, char *);
extern void execute_872(char*, char *);
extern void execute_873(char*, char *);
extern void execute_874(char*, char *);
extern void execute_875(char*, char *);
extern void execute_876(char*, char *);
extern void execute_877(char*, char *);
extern void execute_878(char*, char *);
extern void execute_879(char*, char *);
extern void execute_880(char*, char *);
extern void execute_881(char*, char *);
extern void execute_882(char*, char *);
extern void execute_884(char*, char *);
extern void execute_885(char*, char *);
extern void execute_886(char*, char *);
extern void execute_887(char*, char *);
extern void execute_897(char*, char *);
extern void execute_898(char*, char *);
extern void execute_899(char*, char *);
extern void execute_900(char*, char *);
extern void execute_901(char*, char *);
extern void execute_902(char*, char *);
extern void execute_903(char*, char *);
extern void execute_904(char*, char *);
extern void execute_905(char*, char *);
extern void execute_909(char*, char *);
extern void execute_911(char*, char *);
extern void execute_912(char*, char *);
extern void transaction_0(char*, char*, unsigned, unsigned, unsigned);
extern void vhdl_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[110] = {(funcp)execute_913, (funcp)execute_914, (funcp)execute_915, (funcp)execute_906, (funcp)execute_907, (funcp)execute_23, (funcp)execute_24, (funcp)execute_25, (funcp)execute_26, (funcp)execute_208, (funcp)execute_400, (funcp)execute_401, (funcp)execute_402, (funcp)execute_630, (funcp)execute_631, (funcp)execute_632, (funcp)execute_633, (funcp)execute_634, (funcp)execute_635, (funcp)execute_638, (funcp)execute_639, (funcp)execute_640, (funcp)execute_851, (funcp)execute_852, (funcp)execute_853, (funcp)execute_858, (funcp)execute_859, (funcp)execute_860, (funcp)execute_861, (funcp)execute_862, (funcp)execute_863, (funcp)execute_866, (funcp)execute_867, (funcp)execute_204, (funcp)execute_205, (funcp)execute_29, (funcp)execute_70, (funcp)execute_71, (funcp)execute_31, (funcp)execute_32, (funcp)execute_33, (funcp)execute_34, (funcp)execute_207, (funcp)execute_210, (funcp)execute_212, (funcp)execute_397, (funcp)execute_399, (funcp)execute_404, (funcp)execute_405, (funcp)execute_407, (funcp)execute_411, (funcp)execute_629, (funcp)execute_466, (funcp)execute_439, (funcp)execute_416, (funcp)execute_417, (funcp)execute_418, (funcp)execute_419, (funcp)execute_420, (funcp)execute_637, (funcp)execute_834, (funcp)execute_847, (funcp)execute_848, (funcp)execute_652, (funcp)execute_836, (funcp)execute_838, (funcp)execute_840, (funcp)execute_842, (funcp)execute_844, (funcp)execute_846, (funcp)execute_850, (funcp)execute_855, (funcp)execute_865, (funcp)execute_888, (funcp)execute_889, (funcp)execute_890, (funcp)execute_891, (funcp)execute_892, (funcp)execute_893, (funcp)execute_894, (funcp)execute_895, (funcp)execute_872, (funcp)execute_873, (funcp)execute_874, (funcp)execute_875, (funcp)execute_876, (funcp)execute_877, (funcp)execute_878, (funcp)execute_879, (funcp)execute_880, (funcp)execute_881, (funcp)execute_882, (funcp)execute_884, (funcp)execute_885, (funcp)execute_886, (funcp)execute_887, (funcp)execute_897, (funcp)execute_898, (funcp)execute_899, (funcp)execute_900, (funcp)execute_901, (funcp)execute_902, (funcp)execute_903, (funcp)execute_904, (funcp)execute_905, (funcp)execute_909, (funcp)execute_911, (funcp)execute_912, (funcp)transaction_0, (funcp)vhdl_transfunc_eventcallback};
const int NumRelocateId= 110;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/top_behav/xsim.reloc",  (void **)funcTab, 110);
	iki_vhdl_file_variable_register(dp + 134440);
	iki_vhdl_file_variable_register(dp + 134496);
	iki_vhdl_file_variable_register(dp + 342704);


	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/top_behav/xsim.reloc");
}

	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net

void simulate(char *dp)
{
		iki_schedule_processes_at_time_zero(dp, "xsim.dir/top_behav/xsim.reloc");

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
    iki_set_sv_type_file_path_name("xsim.dir/top_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/top_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/top_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
