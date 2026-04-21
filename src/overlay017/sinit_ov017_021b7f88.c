/* __sinit_ov017_021b7f88: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov017_021b4568(void *obj);
extern void func_ov017_021b456c(void *obj);

extern char data_ov017_021b8604[];
extern char data_ov017_021b8610[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov017_021b7f88(void) {
    func_ov017_021b4568(data_ov017_021b8610);
    __register_global_object(data_ov017_021b8610, func_ov017_021b456c, data_ov017_021b8604);
}

#pragma section INIT end
