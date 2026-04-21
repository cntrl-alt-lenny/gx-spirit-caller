/* __sinit_ov007_021b2f64: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov007_021b2a90(void *obj);
extern void func_ov007_021b2a94(void *obj);

extern char data_ov007_02233520[];
extern char data_ov007_0223352c[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov007_021b2f64(void) {
    func_ov007_021b2a90(data_ov007_0223352c);
    __register_global_object(data_ov007_0223352c, func_ov007_021b2a94, data_ov007_02233520);
}

#pragma section INIT end
