/* __sinit_ov016_021b8ed4: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov016_021b553c(void *obj);
extern void func_ov016_021b5540(void *obj);

extern char data_ov016_021bac2c[];
extern char data_ov016_021bac38[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov016_021b8ed4(void) {
    func_ov016_021b553c(data_ov016_021bac38);
    __register_global_object(data_ov016_021bac38, func_ov016_021b5540, data_ov016_021bac2c);
}

#pragma section INIT end
