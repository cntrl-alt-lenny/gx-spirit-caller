/* __sinit_ov009_021ad868: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov009_021aa4a0(void *obj);
extern void func_ov009_021aa4a4(void *obj);

extern char data_ov009_021adbc0[];
extern char data_ov009_021adbcc[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov009_021ad868(void) {
    func_ov009_021aa4a0(data_ov009_021adbcc);
    __register_global_object(data_ov009_021adbcc, func_ov009_021aa4a4, data_ov009_021adbc0);
}

#pragma section INIT end
