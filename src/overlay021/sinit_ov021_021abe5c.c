/* __sinit_ov021_021abe5c: sibling of src/overlay005/sinit_ov005_021b16e4.c.
 * See that file's header for the full template explanation. */

#include <runtime/sinit.h>

extern void func_ov021_021aaf54(void *obj);
extern void func_ov021_021aaf58(void *obj);

extern char data_ov021_0222cf38[];
extern char data_ov021_0222cf44[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov021_021abe5c(void) {
    func_ov021_021aaf54(data_ov021_0222cf44);
    __register_global_object(data_ov021_0222cf44, func_ov021_021aaf58, data_ov021_0222cf38);
}

#pragma section INIT end
