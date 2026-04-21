/* __sinit_ov019_021b5ab4: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov019_021b4658(void *obj);
extern void func_ov019_021b465c(void *obj);

extern char data_ov019_021b683c[];
extern char data_ov019_021b6848[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov019_021b5ab4(void) {
    func_ov019_021b4658(data_ov019_021b6848);
    __register_global_object(data_ov019_021b6848, func_ov019_021b465c, data_ov019_021b683c);
}

#pragma section INIT end
