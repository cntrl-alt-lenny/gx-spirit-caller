/* __sinit_ov009_021ad8c0: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov009_021ab840(void *obj);
extern void func_ov009_021ab844(void *obj);

extern char data_ov009_021adc48[];
extern char data_ov009_021adc54[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov009_021ad8c0(void) {
    func_ov009_021ab840(data_ov009_021adc54);
    __register_global_object(data_ov009_021adc54, func_ov009_021ab844, data_ov009_021adc48);
}

#pragma section INIT end
