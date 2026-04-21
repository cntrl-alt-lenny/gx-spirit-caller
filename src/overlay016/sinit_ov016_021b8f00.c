/* __sinit_ov016_021b8f00: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov016_021b5fa8(void *obj);
extern void func_ov016_021b5fac(void *obj);

extern char data_ov016_021bac58[];
extern char data_ov016_021bac64[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov016_021b8f00(void) {
    func_ov016_021b5fa8(data_ov016_021bac64);
    __register_global_object(data_ov016_021bac64, func_ov016_021b5fac, data_ov016_021bac58);
}

#pragma section INIT end
