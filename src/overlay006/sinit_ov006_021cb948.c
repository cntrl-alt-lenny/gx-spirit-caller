/* __sinit_ov006_021cb948: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov006_021c507c(void *obj);
extern void func_ov006_021c5080(void *obj);

extern char data_ov006_0225dc14[];
extern char data_ov006_0225dc34[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov006_021cb948(void) {
    func_ov006_021c507c(data_ov006_0225dc34);
    __register_global_object(data_ov006_0225dc34, func_ov006_021c5080, data_ov006_0225dc14);
}

#pragma section INIT end
