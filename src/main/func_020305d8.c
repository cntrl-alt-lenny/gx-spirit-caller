/* func_020305d8: pattern N2 — switch defeats predication collapse.
 *
 *     push  {r3, lr}
 *     ldr   r1, [pc, #32]
 *     cmp   r0, r1
 *     bne   .L_else
 *     mov   r0, #0
 *     pop   {r3, pc}
 *   .L_else:
 *     bl    helper
 *     cmp   r0, #0
 *     moveq r0, #1
 *     movne r0, #0
 *     pop   {r3, pc}
 *     .word 0x000017c4
 *
 * Brief 248 pattern N2. Recipe: `switch (arg) { case K: return 0;
 * default: ... }` defeats mwcc's predication collapse. The natural
 * `if (arg == K) return 0;` form collapses to `moveq r0, #0; popeq`
 * (predicated execution). Same trick as brief 241's switch shapes.
 *
 * The brace style in if-then doesn't matter — both `{ return 0; }`
 * and `return 0;` collapse. Only switch forces the hard branch.
 */
extern int func_0203058c(int arg);

int func_020305d8(int arg) {
    switch (arg) {
    case 0x17c4: return 0;
    default: return (func_0203058c(arg) == 0);
    }
}
