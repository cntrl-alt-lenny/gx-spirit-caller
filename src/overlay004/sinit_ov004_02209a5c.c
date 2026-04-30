/* __sinit_ov004_02209a5c: CodeWarrior per-TU static-initializer stub.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r0, =data_ov004_022915e8       ; ctor argument (the object)
 *     bl    func_ov004_021d8640             ; ctor(&obj)
 *     ldr   r0, =data_ov004_022915e8
 *     ldr   r1, =func_ov004_021d8644        ; dtor to register
 *     ldr   r2, =data_ov004_022915dc        ; atexit-chain slot
 *     bl    __register_global_object       ; CW runtime's dtor-chain registrar
 *     ldmia sp!, {r3, pc}
 *
 * The last unmatched `__sinit_*` outlier in the named tier — closes
 * named to 39/39. Lives in ov004 (failing-module), so was historically
 * deferred. Cross-file drift check (#185) makes attempting it safer.
 *
 * Same 0x2c-byte CodeWarrior shape as ov005's `__sinit_*` set.
 */

#include <runtime/sinit.h>

extern void func_ov004_021d8640(void *obj);
extern void func_ov004_021d8644(void *obj);

extern char data_ov004_022915dc[];
extern char data_ov004_022915e8[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov004_02209a5c(void) {
    func_ov004_021d8640(data_ov004_022915e8);
    __register_global_object(data_ov004_022915e8, func_ov004_021d8644, data_ov004_022915dc);
}

#pragma section INIT end
