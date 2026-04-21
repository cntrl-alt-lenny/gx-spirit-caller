/* __sinit_ov017_021b7fb4: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov017_021b6804(void *obj);
extern void func_ov017_021b6808(void *obj);

extern char data_ov017_021b8788[];
extern char data_ov017_021b8894[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov017_021b7fb4(void) {
    func_ov017_021b6804(data_ov017_021b8894);
    __register_global_object(data_ov017_021b8894, func_ov017_021b6808, data_ov017_021b8788);
}

#pragma section INIT end
