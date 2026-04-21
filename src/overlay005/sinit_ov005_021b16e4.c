/* __sinit_ov005_021b16e4: CodeWarrior per-TU static-initializer stub.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r0, =data_ov005_021b1d4c      ; address of the constructed object
 *     bl    func_ov005_021aa4a4           ; ctor(&obj)
 *     ldr   r0, =data_ov005_021b1d4c
 *     ldr   r1, =func_ov005_021aa4a8      ; dtor to register
 *     ldr   r2, =data_ov005_021b1d40      ; atexit-chain slot
 *     bl    __register_global_object     ; CW runtime's dtor-chain registrar
 *     ldmia sp!, {r3, pc}
 *
 * The 0x2c-byte pattern mwcc emits for every non-trivial C++ global
 * object: construct, then enqueue the destructor via
 * __register_global_object (one shared function in ARM9 main, addr
 * 0x020b42f4, called by all 44 `__sinit_*` shells across 15 overlays
 * — see libs/runtime/README.md).
 *
 * The `#pragma define_section` / `#pragma section ... begin/end`
 * pair is the mwcc-ARM native form (same syntax NitroSDK uses for
 * its own `.sinit` hook in include/nitro/sinit.h) to route a symbol
 * into a specific ELF section — here, `.init`.
 */

#include <runtime/sinit.h>

extern void func_ov005_021aa4a4(void *obj);
extern void func_ov005_021aa4a8(void *obj);

extern char data_ov005_021b1d40[];
extern char data_ov005_021b1d4c[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

void __sinit_ov005_021b16e4(void) {
    func_ov005_021aa4a4(data_ov005_021b1d4c);
    __register_global_object(data_ov005_021b1d4c, func_ov005_021aa4a8, data_ov005_021b1d40);
}

#pragma section INIT end
