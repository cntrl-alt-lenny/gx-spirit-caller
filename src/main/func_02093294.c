/* func_02093294: arg-preserving thunk via push-r0 spill (W-E /
 * C-12). Calls func_020932a4(x) and returns x. The push of r0
 * alongside lr stashes the arg directly on the stack — no
 * callee-save register touched. mwcc cannot generate this from
 * any C variation; we use `asm void` + `nofralloc` per C-12.
 *
 *     stmdb sp!, {r0, lr}
 *     bl    func_020932a4
 *     ldmia sp!, {r0, lr}
 *     bx    lr
 *
 * Routes through the DEFAULT `.c` rule (mwcc 2.0/sp1p5) — the
 * legacy 1.2/sp2p3 compiler's inline-asm parser rejects the
 * `stmdb sp!`/`ldmia sp!` syntax. See codegen-walls.md C-12.
 */

extern int func_020932a4(int x);

asm void func_02093294(int x) {
    nofralloc
    stmdb sp!, {r0, lr}
    bl    func_020932a4
    ldmia sp!, {r0, lr}
    bx    lr
}
