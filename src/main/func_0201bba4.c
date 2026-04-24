/* func_0201bba4: dispatches to __sinit_ov007_021b2f64(&data_020c5ce4),
 * stashes the return pointer in state[0x810], returns 1.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    GetSystemWork
 *     mov   r4, r0
 *     ldr   r0, .L_0201bbc4            ; r0 = &data_020c5ce4
 *     bl    __sinit_ov007_021b2f64
 *     str   r0, [r4, #0x810]
 *     mov   r0, #0x1
 *     ldmia sp!, {r4, pc}
 *
 * 8 ARM instructions + 1 pool word, 0x24 bytes.
 */

extern char *GetSystemWork(void);
extern void *__sinit_ov007_021b2f64(void *p);
extern char data_020c5ce4[];

int func_0201bba4(void) {
    char *state = GetSystemWork();
    *(void **)(state + 0x810) = __sinit_ov007_021b2f64(data_020c5ce4);
    return 1;
}
