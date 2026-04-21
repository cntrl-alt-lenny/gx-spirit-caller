/* __sinit_ov006_021cb8f0: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov006_021c1554(void *obj);
extern void func_ov006_021c1558(void *obj);

extern char data_ov006_0225cb50[];
extern char data_ov006_0225cb5c[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov006_021cb8f0(void) {
    func_ov006_021c1554(data_ov006_0225cb5c);
    __register_global_object(data_ov006_0225cb5c, func_ov006_021c1558, data_ov006_0225cb50);
}

#pragma section INIT end
