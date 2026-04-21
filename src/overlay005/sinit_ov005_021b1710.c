/* __sinit_ov005_021b1710: sibling of sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov005_021aaf00(void *obj);
extern void func_ov005_021aaf04(void *obj);

extern char data_ov005_021b1da8[];
extern char data_ov005_021b1db4[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov005_021b1710(void) {
    func_ov005_021aaf00(data_ov005_021b1db4);
    __register_global_object(data_ov005_021b1db4, func_ov005_021aaf04, data_ov005_021b1da8);
}

#pragma section INIT end
