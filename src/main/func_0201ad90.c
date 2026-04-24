/* func_0201ad90: call-and-ignore pattern — invokes GetSystemWork
 * for side effect (ignored return), then returns 0.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     mov   r0, #0x0
 *     ldmia sp!, {r3, pc}
 *
 * 4 ARM instructions, 0x10 bytes. Same shape as func_020196b0 from
 * #147 but without the range check — just the "call + return const"
 * variant.
 */

extern char *GetSystemWork(void);

int func_0201ad90(void) {
    (void)GetSystemWork();
    return 0;
}
