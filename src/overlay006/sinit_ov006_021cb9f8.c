/* __sinit_ov006_021cb9f8: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov006_021c9ecc(void *obj);
extern void func_ov006_021c9ed0(void *obj);

extern char data_ov006_0225e05c[];
extern char data_ov006_0225e068[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov006_021cb9f8(void) {
    func_ov006_021c9ecc(data_ov006_0225e068);
    __register_global_object(data_ov006_0225e068, func_ov006_021c9ed0, data_ov006_0225e05c);
}

#pragma section INIT end
