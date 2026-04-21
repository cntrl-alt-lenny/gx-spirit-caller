/* __sinit_ov003_021cf114: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov003_021ca2b4(void *obj);
extern void func_ov003_021ca2b8(void *obj);

extern char data_ov003_021cf720[];
extern char data_ov003_021cf72c[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov003_021cf114(void) {
    func_ov003_021ca2b4(data_ov003_021cf72c);
    __register_global_object(data_ov003_021cf72c, func_ov003_021ca2b8, data_ov003_021cf720);
}

#pragma section INIT end
