/* __sinit_ov007_021b2f38: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov007_021b2560(void *obj);
extern void func_ov007_021b2564(void *obj);

extern char data_ov007_022334c4[];
extern char data_ov007_022334d0[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov007_021b2f38(void) {
    func_ov007_021b2560(data_ov007_022334d0);
    __register_global_object(data_ov007_022334d0, func_ov007_021b2564, data_ov007_022334c4);
}

#pragma section INIT end
