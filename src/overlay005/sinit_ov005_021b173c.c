/* __sinit_ov005_021b173c: sibling of sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov005_021ab3e0(void *obj);
extern void func_ov005_021ab3e4(void *obj);

extern char data_ov005_021b1dd0[];
extern char data_ov005_021b1ddc[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov005_021b173c(void) {
    func_ov005_021ab3e0(data_ov005_021b1ddc);
    __register_global_object(data_ov005_021b1ddc, func_ov005_021ab3e4, data_ov005_021b1dd0);
}

#pragma section INIT end
