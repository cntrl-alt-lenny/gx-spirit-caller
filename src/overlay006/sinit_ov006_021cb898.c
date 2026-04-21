/* __sinit_ov006_021cb898: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov006_021b5c24(void *obj);
extern void func_ov006_021b5c28(void *obj);

extern char data_ov006_0224f3f4[];
extern char data_ov006_0224f448[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov006_021cb898(void) {
    func_ov006_021b5c24(data_ov006_0224f448);
    __register_global_object(data_ov006_0224f448, func_ov006_021b5c28, data_ov006_0224f3f4);
}

#pragma section INIT end
