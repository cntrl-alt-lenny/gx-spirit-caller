/* __sinit_ov002_022ca808: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov002_022b5588(void *obj);
extern void func_ov002_022b558c(void *obj);

extern char data_ov002_022d1b70[];
extern char data_ov002_022d1b7c[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov002_022ca808(void) {
    func_ov002_022b5588(data_ov002_022d1b7c);
    __register_global_object(data_ov002_022d1b7c, func_ov002_022b558c, data_ov002_022d1b70);
}

#pragma section INIT end
