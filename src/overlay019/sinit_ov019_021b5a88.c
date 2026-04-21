/* __sinit_ov019_021b5a88: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov019_021b2ae0(void *obj);
extern void func_ov019_021b2ae4(void *obj);

extern char data_ov019_021b5e64[];
extern char data_ov019_021b5e70[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov019_021b5a88(void) {
    func_ov019_021b2ae0(data_ov019_021b5e70);
    __register_global_object(data_ov019_021b5e70, func_ov019_021b2ae4, data_ov019_021b5e64);
}

#pragma section INIT end
