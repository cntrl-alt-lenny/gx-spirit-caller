/* __sinit_ov006_021cba50: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov006_021cb028(void *obj);
extern void func_ov006_021cb02c(void *obj);

extern char data_ov006_0225e12c[];
extern char data_ov006_0225e138[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov006_021cba50(void) {
    func_ov006_021cb028(data_ov006_0225e138);
    __register_global_object(data_ov006_0225e138, func_ov006_021cb02c, data_ov006_0225e12c);
}

#pragma section INIT end
