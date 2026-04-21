/* __sinit_ov014_021b4c18: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov014_021b2744(void *obj);
extern void func_ov014_021b2748(void *obj);

extern char data_ov014_02235088[];
extern char data_ov014_02235094[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov014_021b4c18(void) {
    func_ov014_021b2744(data_ov014_02235094);
    __register_global_object(data_ov014_02235094, func_ov014_021b2748, data_ov014_02235088);
}

#pragma section INIT end
