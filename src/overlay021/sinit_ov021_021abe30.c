/* __sinit_ov021_021abe30: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov021_021aa9b4(void *obj);
extern void func_ov021_021aa9b8(void *obj);

extern char data_ov021_0222cec8[];
extern char data_ov021_0222ced4[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov021_021abe30(void) {
    func_ov021_021aa9b4(data_ov021_0222ced4);
    __register_global_object(data_ov021_0222ced4, func_ov021_021aa9b8, data_ov021_0222cec8);
}

#pragma section INIT end
