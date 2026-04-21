/* __sinit_ov019_021b5ae0: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov019_021b52e8(void *obj);
extern void func_ov019_021b52ec(void *obj);

extern char data_ov019_021b6914[];
extern char data_ov019_021b6920[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov019_021b5ae0(void) {
    func_ov019_021b52e8(data_ov019_021b6920);
    __register_global_object(data_ov019_021b6920, func_ov019_021b52ec, data_ov019_021b6914);
}

#pragma section INIT end
