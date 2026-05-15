/* func_02048e60: null-check global ptr + 3-field clear. Clears word at +0
 * and bytes at +0x1e / +0x1f. Reloads global pointer between each write.
 *
 *     ldr   r0, .L_02048f00           ; data_0219dba0
 *     ldr   r1, [r0, #0x0]
 *     cmp   r1, #0x0
 *     bxeq  lr
 *     mov   r2, #0x0
 *     str   r2, [r1, #0x0]
 *     ldr   r1, [r0, #0x0]
 *     strb  r2, [r1, #0x1e]
 *     ldr   r0, [r0, #0x0]
 *     strb  r2, [r0, #0x1f]
 *     bx    lr
 */

typedef struct {
    unsigned int  f_0;
    char          _pad0[0x1a];
    unsigned char f_1e;
    unsigned char f_1f;
} state_02048ed4_t;

extern state_02048ed4_t *data_0219dba0;

void func_02048e60(void) {
    if (data_0219dba0 == 0) return;
    data_0219dba0->f_0 = 0;
    data_0219dba0->f_1e = 0;
    data_0219dba0->f_1f = 0;
}
