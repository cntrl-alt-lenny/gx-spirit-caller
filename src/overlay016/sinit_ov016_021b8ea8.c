/* __sinit_ov016_021b8ea8: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov016_021b3a70(void *obj);
extern void func_ov016_021b3a74(void *obj);

extern char data_ov016_021babe0[];
extern char data_ov016_021babec[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov016_021b8ea8(void) {
    func_ov016_021b3a70(data_ov016_021babec);
    __register_global_object(data_ov016_021babec, func_ov016_021b3a74, data_ov016_021babe0);
}

#pragma section INIT end
