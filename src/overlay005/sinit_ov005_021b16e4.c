/* __sinit_ov005_021b16e4: CodeWarrior per-TU static-initializer stub.
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r0, =data_ov005_021b1d4c   ; address of the constructed object
 *     bl    func_ov005_021aa4a4        ; ctor(&obj)
 *     ldr   r0, =data_ov005_021b1d4c
 *     ldr   r1, =func_ov005_021aa4a8   ; dtor to register
 *     ldr   r2, =data_ov005_021b1d40   ; atexit-chain slot
 *     bl    func_020b42f4              ; __register_global_destructor_chain-like
 *     ldmia sp!, {r3, pc}
 *
 * This is the 0x2c-byte pattern mwcc emits for every non-trivial
 * C++ global object: construct, then enqueue the destructor via
 * func_020b42f4 (destructor-chain registrar in main). There are 44
 * identical-size siblings of this stub across 15 overlays — see
 * libs/runtime/README.md.
 *
 * The `#pragma define_section` / `#pragma section ... begin/end` pair
 * is the mwcc-ARM native form (same syntax NitroSDK uses for its own
 * `.sinit` hook in include/nitro/sinit.h) to route a symbol into a
 * specific ELF section — here, `.init`, where the linker script
 * expects per-TU static initializers to land.
 */

extern void func_ov005_021aa4a4(void *obj);
extern void func_ov005_021aa4a8(void *obj);
extern void func_020b42f4(void *obj, void (*dtor)(void *), void *chain_slot);

extern char data_ov005_021b1d40[];
extern char data_ov005_021b1d4c[];

#pragma define_section INIT ".init" abs32 RX
#pragma section INIT begin

asm void __sinit_ov005_021b16e4(void) {
    nofralloc
    stmdb sp!, {r3, lr}
    ldr  r0, =data_ov005_021b1d4c
    bl   func_ov005_021aa4a4
    ldr  r0, =data_ov005_021b1d4c
    ldr  r1, =func_ov005_021aa4a8
    ldr  r2, =data_ov005_021b1d40
    bl   func_020b42f4
    ldmia sp!, {r3, pc}
}

#pragma section INIT end
