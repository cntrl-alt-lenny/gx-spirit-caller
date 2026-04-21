/* __sinit_ov006_021cb91c: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov006_021c19a0(void *obj);
extern void func_ov006_021c19a4(void *obj);

extern char data_ov006_0225cb7c[];
extern char data_ov006_0225cbb8[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov006_021cb91c(void) {
    func_ov006_021c19a0(data_ov006_0225cbb8);
    __register_global_object(data_ov006_0225cbb8, func_ov006_021c19a4, data_ov006_0225cb7c);
}

#pragma section INIT end
