/* func_0201ac60: return pointer into data_020b5a8c at stride 6,
 * 1-indexed. `data_020b5a8c + (arg - 1) * 6`.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    GetSystemWork
 *     ldr   r2, .L_0201ac80
 *     sub   r1, r4, #0x1                ; r1 = arg - 1
 *     mov   r0, #0x6                    ; stride = 6
 *     mla   r0, r1, r0, r2              ; r0 = r1 * 6 + data
 *     ldmia sp!, {r4, pc}
 *   .L_0201ac80: .word data_020b5a8c
 *
 * 8 ARM instructions + 1 pool word, 0x24 bytes.
 *
 * GetSystemWork call is side-effect-only. The 1-indexed stride-6
 * lookup suggests an entry table where each entry is 6 bytes
 * (perhaps a 2-short+2-byte record, or a short + 4-byte code).
 */

extern char *GetSystemWork(void);
extern char data_020b5a8c[];

char *func_0201ac60(int idx) {
    (void)GetSystemWork();
    return data_020b5a8c + (idx - 1) * 6;
}
