/* __sinit_ov015_021b5b14: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov015_021b2334(void *obj);
extern void func_ov015_021b2348(void *obj);

extern char data_ov015_021b5d40[];
extern char data_ov015_021b5d4c[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov015_021b5b14(void) {
    func_ov015_021b2334(data_ov015_021b5d4c);
    __register_global_object(data_ov015_021b5d4c, func_ov015_021b2348, data_ov015_021b5d40);
}

#pragma section INIT end
