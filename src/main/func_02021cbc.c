/* func_02021cbc: load-clear-and-test — `if (*p) { *p = 0; return 1; } return 0;`.
 *
 *     ldr r1, [r0, #0x0]
 *     cmp r1, #0x0
 *     moveq r0, #0x0
 *     movne r1, #0x0
 *     strne r1, [r0, #0x0]
 *     movne r0, #0x1
 *     bx  lr
 *
 * Identical asm to func_020240a0 — separate compilations of the same
 * shape on different call-sites.
 */

int func_02021cbc(int *p) {
    if (*p == 0) return 0;
    *p = 0;
    return 1;
}
