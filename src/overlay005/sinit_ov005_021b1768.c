/* __sinit_ov005_021b1768: sibling of sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov005_021ad058(void *obj);
extern void func_ov005_021ad05c(void *obj);

extern char data_ov005_021b1e60[];
extern char data_ov005_021b1e6c[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov005_021b1768(void) {
    func_ov005_021ad058(data_ov005_021b1e6c);
    __register_global_object(data_ov005_021b1e6c, func_ov005_021ad05c, data_ov005_021b1e60);
}

#pragma section INIT end
