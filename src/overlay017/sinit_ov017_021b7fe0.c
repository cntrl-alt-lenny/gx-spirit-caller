/* __sinit_ov017_021b7fe0: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov017_021b7738(void *obj);
extern void func_ov017_021b773c(void *obj);

extern char data_ov017_021b8a90[];
extern char data_ov017_021b8a9c[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov017_021b7fe0(void) {
    func_ov017_021b7738(data_ov017_021b8a9c);
    __register_global_object(data_ov017_021b8a9c, func_ov017_021b773c, data_ov017_021b8a90);
}

#pragma section INIT end
