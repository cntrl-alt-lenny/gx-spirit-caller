/* func_02054bf0: tail-call wrapper for func_02054e34(0, -1).
 *
 *     ldr ip, .L_02054c74
 *     mov r0, #0
 *     mvn r1, #0                          ; ← mvn, not sub r1, r0, #1
 *     bx  ip
 *  .L_02054c74: .word func_02054e34
 *
 * **C-15 routing**: mwcc 2.0 emits `sub r1, r0, #1` peephole;
 * legacy 1.2/sp2p3 emits `mvn r1, #0` directly. Flat thunk →
 * route through `.legacy.c` per C-15.
 */

extern int func_02054e34(int a, int b);

int func_02054bf0(void) {
    return func_02054e34(0, -1);
}
