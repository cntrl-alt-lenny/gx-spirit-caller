/* __sinit_ov017_021b7f5c: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov017_021b2dd4(void *obj);
extern void func_ov017_021b2dd8(void *obj);

extern char data_ov017_021b8564[];
extern char data_ov017_021b8570[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov017_021b7f5c(void) {
    func_ov017_021b2dd4(data_ov017_021b8570);
    __register_global_object(data_ov017_021b8570, func_ov017_021b2dd8, data_ov017_021b8564);
}

#pragma section INIT end
