/* __sinit_ov006_021cba24: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov006_021cac08(void *obj);
extern void func_ov006_021cac0c(void *obj);

extern char data_ov006_0225e0f4[];
extern char data_ov006_0225e100[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov006_021cba24(void) {
    func_ov006_021cac08(data_ov006_0225e100);
    __register_global_object(data_ov006_0225e100, func_ov006_021cac0c, data_ov006_0225e0f4);
}

#pragma section INIT end
