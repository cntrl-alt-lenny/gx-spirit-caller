/* __sinit_ov015_021b5b40: size=0x3c outlier — two ctors + registrar.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r0, =data_ov015_021b6694   ; first ctor arg
 *     bl    func_ov015_021b285c        ; ctor1(&obj_a)
 *     ldr   r0, =data_ov015_021b66c4   ; second ctor arg
 *     bl    func_ov015_021b3168        ; ctor2(&obj_b)
 *     ldr   r0, =data_ov015_021b5e44   ; obj for registrar
 *     ldr   r1, =func_ov015_021b5a6c   ; dtor
 *     ldr   r2, =data_ov015_021b5e28   ; chain slot
 *     bl    __register_global_object
 *     ldmia sp!, {r3, pc}
 *
 * Same shape as the 0x2c template but with an extra ctor call at
 * the top — one TU, two globals with non-trivial ctors, only one
 * of them with a registered dtor. The obj of the second ctor
 * (data_ov015_021b66c4) is evidently trivially destructible (POD
 * or compiler-generated default dtor), so it doesn't appear in the
 * __register_global_object call.
 */

#include <runtime/sinit.h>

extern void func_ov015_021b285c(void *obj);
extern void func_ov015_021b3168(void *obj);
extern void func_ov015_021b5a6c(void *obj);

extern char data_ov015_021b5e28[];
extern char data_ov015_021b5e44[];
extern char data_ov015_021b6694[];
extern char data_ov015_021b66c4[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov015_021b5b40(void) {
    func_ov015_021b285c(data_ov015_021b6694);
    func_ov015_021b3168(data_ov015_021b66c4);
    __register_global_object(data_ov015_021b5e44, func_ov015_021b5a6c, data_ov015_021b5e28);
}

#pragma section INIT end
