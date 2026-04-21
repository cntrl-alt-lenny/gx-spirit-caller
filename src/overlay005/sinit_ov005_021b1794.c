/* __sinit_ov005_021b1794: sibling of sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov005_021b0b28(void *obj);
extern void func_ov005_021b0b2c(void *obj);

extern char data_ov005_021b2240[];
extern char data_ov005_021b224c[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov005_021b1794(void) {
    func_ov005_021b0b28(data_ov005_021b224c);
    __register_global_object(data_ov005_021b224c, func_ov005_021b0b2c, data_ov005_021b2240);
}

#pragma section INIT end
