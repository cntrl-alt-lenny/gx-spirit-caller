/* func_02087eb0: null-checked nested clear — if `(*pp)` is non-null,
 * zero its first int and zero `*pp` itself.
 *
 *     ldr r2, [r0, #0x0]
 *     cmp r2, #0x0
 *     movne r1, #0x0
 *     strne r1, [r2, #0x0]
 *     strne r1, [r0, #0x0]
 *     bx  lr
 */

void func_02087eb0(int **pp) {
    int *p = *pp;
    if (p != 0) {
        *p = 0;
        *pp = 0;
    }
}
