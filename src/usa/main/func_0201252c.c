/* func_0201252c: multi-field constant initialization (11 stores). Fixed
 * padding: `_pad_ba0` is 0x10 bytes (not 0x11) so `f_ba0` lands at 0xba0.
 *
 *     ldr   r2, .L_020125a8           ; data_02103fcc
 *     mov   ip, #0x0
 *     str   ip, [r2, #0xba0]
 *     str   ip, [r2, #0xbbc]
 *     mov   r3, #0x1b
 *     str   r3, [r2, #0xbc0]
 *     str   ip, [r2, #0xc3c]
 *     str   ip, [r2, #0xc48]
 *     str   ip, [r2, #0xc40]
 *     mov   r3, #0x1
 *     str   r3, [r2, #0xc44]
 *     mov   r3, #0x3
 *     str   r3, [r2, #0xb88]
 *     str   r0, [r2, #0xb8c]
 *     mov   r0, #0x30
 *     str   r0, [r2, #0xb84]
 *     str   r1, [r2, #0xba4]
 *     bx    lr
 */

typedef struct {
    char         _pad_b84[0xb84];
    int          f_b84;
    int          f_b88;
    int          f_b8c;
    char         _pad_ba0[0x10];   /* 0xb90..0xba0 (was 0x11 — off-by-one) */
    int          f_ba0;
    int          f_ba4;
    char         _pad_bbc[0x14];
    int          f_bbc;
    int          f_bc0;
    char         _pad_c3c[0x78];
    int          f_c3c;
    int          f_c40;
    int          f_c44;
    int          f_c48;
} state_02012560_t;

extern state_02012560_t data_02103fcc;

void func_0201252c(int a, int b) {
    data_02103fcc.f_ba0 = 0;
    data_02103fcc.f_bbc = 0;
    data_02103fcc.f_bc0 = 0x1b;
    data_02103fcc.f_c3c = 0;
    data_02103fcc.f_c48 = 0;
    data_02103fcc.f_c40 = 0;
    data_02103fcc.f_c44 = 1;
    data_02103fcc.f_b88 = 3;
    data_02103fcc.f_b8c = a;
    data_02103fcc.f_b84 = 0x30;
    data_02103fcc.f_ba4 = b;
}
