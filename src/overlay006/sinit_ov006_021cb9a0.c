/* __sinit_ov006_021cb9a0: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov006_021c6bf8(void *obj);
extern void func_ov006_021c6bfc(void *obj);

extern char data_ov006_0225dea8[];
extern char data_ov006_0225deb4[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov006_021cb9a0(void) {
    func_ov006_021c6bf8(data_ov006_0225deb4);
    __register_global_object(data_ov006_0225deb4, func_ov006_021c6bfc, data_ov006_0225dea8);
}

#pragma section INIT end
