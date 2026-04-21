/* __sinit_ov006_021cb9cc: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov006_021c7554(void *obj);
extern void func_ov006_021c7558(void *obj);

extern char data_ov006_0225df30[];
extern char data_ov006_0225df3c[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov006_021cb9cc(void) {
    func_ov006_021c7554(data_ov006_0225df3c);
    __register_global_object(data_ov006_0225df3c, func_ov006_021c7558, data_ov006_0225df30);
}

#pragma section INIT end
