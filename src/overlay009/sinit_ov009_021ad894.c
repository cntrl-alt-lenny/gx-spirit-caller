/* __sinit_ov009_021ad894: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov009_021ab1b4(void *obj);
extern void func_ov009_021ab1b8(void *obj);

extern char data_ov009_021adbf4[];
extern char data_ov009_021adc00[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov009_021ad894(void) {
    func_ov009_021ab1b4(data_ov009_021adc00);
    __register_global_object(data_ov009_021adc00, func_ov009_021ab1b8, data_ov009_021adbf4);
}

#pragma section INIT end
