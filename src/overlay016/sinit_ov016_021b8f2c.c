/* __sinit_ov016_021b8f2c: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov016_021b77c4(void *obj);
extern void func_ov016_021b77c8(void *obj);

extern char data_ov016_021bb1a4[];
extern char data_ov016_021bb2c4[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov016_021b8f2c(void) {
    func_ov016_021b77c4(data_ov016_021bb2c4);
    __register_global_object(data_ov016_021bb2c4, func_ov016_021b77c8, data_ov016_021bb1a4);
}

#pragma section INIT end
