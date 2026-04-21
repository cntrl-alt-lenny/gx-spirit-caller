/* __sinit_ov006_021cb974: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov006_021c695c(void *obj);
extern void func_ov006_021c6960(void *obj);

extern char data_ov006_0225de64[];
extern char data_ov006_0225de70[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov006_021cb974(void) {
    func_ov006_021c695c(data_ov006_0225de70);
    __register_global_object(data_ov006_0225de70, func_ov006_021c6960, data_ov006_0225de64);
}

#pragma section INIT end
