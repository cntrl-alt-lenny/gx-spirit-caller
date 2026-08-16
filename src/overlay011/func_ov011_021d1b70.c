/* func_ov011_021d1b70: pick a signed-byte value from one of two lookup
 * tables (or a helper) by idx range, stash idx into the 284 bitfield's
 * idxbyte slot, then dispatch on the 264 mode word: mode 0 runs the settle
 * pass and writes state 4; mode 1 compares the picked value against a 268
 * sub-field and writes state 7 (match, via 021d191c) or state 3 (mismatch,
 * via 021d1ce8), both also stashing the value's low nibble.
 *
 *     stmdb sp!, {r4, r5, r6, lr}
 *     mov   r6, r0
 *     cmp   r6, #0x7d
 *     ldr   r4, .L_LIT0          ; data_ov011_021d403c
 *     blt   .L_2c
 *     ...
 *     ldmia sp!, {r4, r5, r6, pc}
 */

extern char data_ov011_021d403c[];
extern signed char data_ov011_021d3594[];
extern signed char data_ov011_021d35ac[];

extern int func_0201b690(int a0);
extern void func_ov011_021cf048(void);
extern void func_ov011_021d1c80(int v);
extern void func_ov011_021d191c(int idx);
extern void func_ov011_021d1ce8(void);

void func_ov011_021d1b70(int idx) {
    char *b = data_ov011_021d403c;
    int v;
    int mode;

    if (idx >= 0x7d) {
        v = *(signed char *)(data_ov011_021d3594 + (idx - 0x7d) * 6);
        goto have_v;
    }
    if (idx >= 0x66) {
        v = *(signed char *)(data_ov011_021d35ac + (idx - 0x66) * 2);
        goto have_v;
    }
    v = func_0201b690(idx);
have_v:;

    *(int *)(b + 0x284) = (*(int *)(b + 0x284) & ~0xff000) | (((unsigned int)idx << 24) >> 12);

    mode = *(int *)(b + 0x264);
    switch (mode) {
    case 0:
        func_ov011_021cf048();
        func_ov011_021d1c80(v);
        *(int *)(b + 0x284) = (*(int *)(b + 0x284) & ~0xf00) | (((unsigned int)v << 28) >> 20);
        *(int *)(b + 0x284) = (*(int *)(b + 0x284) & ~0xff) | 4;
        break;
    case 1: {
        unsigned int f268 = *(unsigned int *)(b + 0x268);
        if (v == (int)((f268 << 23) >> 28)) {
            func_ov011_021d191c(idx);
            *(int *)(b + 0x284) = (*(int *)(b + 0x284) & ~0xff) | 7;
            *(int *)(b + 0x284) = (*(int *)(b + 0x284) & ~0xf00) | (((unsigned int)v << 28) >> 20);
        } else {
            func_ov011_021d1ce8();
            *(int *)(b + 0x284) = (*(int *)(b + 0x284) & ~0xff) | 3;
            *(int *)(b + 0x284) = (*(int *)(b + 0x284) & ~0xf00) | (((unsigned int)v << 28) >> 20);
        }
        break;
    }
    }
}
