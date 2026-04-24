/* func_0201b7e0: extract bits 28..31 (top nibble) of obj[0xc] via r4
 * as cached arg. Calls GetSystemWork for side effect (return ignored).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    GetSystemWork
 *     ldr   r0, [r4, #0xc]           ; load from CACHED arg, not state!
 *     mov   r0, r0, lsl #0x1c
 *     mov   r0, r0, lsr #0x1c
 *     ldmia sp!, {r4, pc}
 *
 * 7 ARM instructions, 0x1c bytes.
 *
 * Note: the ldr uses r4 (caller's arg) as base, not r0 (the state
 * returned by GetSystemWork). The GetSystemWork call result is
 * discarded — likely a side-effect call for ensuring state is
 * initialised. Same "seemingly-dead call" pattern as func_020196b0.
 */

extern char *GetSystemWork(void);

unsigned int func_0201b7e0(void *obj) {
    int v;
    (void)GetSystemWork();
    v = *(int *)((char *)obj + 0xc);
    return (unsigned int)(v << 28) >> 28;
}
