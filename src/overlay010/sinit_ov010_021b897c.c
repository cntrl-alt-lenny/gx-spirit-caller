/* __sinit_ov010_021b897c: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov010_021b2334(void *obj);
extern void func_ov010_021b2348(void *obj);

extern char data_ov010_021b8c20[];
extern char data_ov010_021b8c2c[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov010_021b897c(void) {
    func_ov010_021b2334(data_ov010_021b8c2c);
    __register_global_object(data_ov010_021b8c2c, func_ov010_021b2348, data_ov010_021b8c20);
}

#pragma section INIT end
