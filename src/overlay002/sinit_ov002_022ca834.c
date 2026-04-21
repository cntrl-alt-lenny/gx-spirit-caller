/* __sinit_ov002_022ca834: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov002_022bdb10(void *obj);
extern void func_ov002_022bdb14(void *obj);

extern char data_ov002_022d28f0[];
extern char data_ov002_022d28fc[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov002_022ca834(void) {
    func_ov002_022bdb10(data_ov002_022d28fc);
    __register_global_object(data_ov002_022d28fc, func_ov002_022bdb14, data_ov002_022d28f0);
}

#pragma section INIT end
