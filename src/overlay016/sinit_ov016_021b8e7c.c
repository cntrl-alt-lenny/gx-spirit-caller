/* __sinit_ov016_021b8e7c: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov016_021b2b24(void *obj);
extern void func_ov016_021b2b28(void *obj);

extern char data_ov016_021bab38[];
extern char data_ov016_021bab44[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov016_021b8e7c(void) {
    func_ov016_021b2b24(data_ov016_021bab44);
    __register_global_object(data_ov016_021bab44, func_ov016_021b2b28, data_ov016_021bab38);
}

#pragma section INIT end
