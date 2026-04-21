/* __sinit_ov006_021cb8c4: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov006_021b9ef0(void *obj);
extern void func_ov006_021b9ef4(void *obj);

extern char data_ov006_0225c4d0[];
extern char data_ov006_0225c4dc[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov006_021cb8c4(void) {
    func_ov006_021b9ef0(data_ov006_0225c4dc);
    __register_global_object(data_ov006_0225c4dc, func_ov006_021b9ef4, data_ov006_0225c4d0);
}

#pragma section INIT end
