/* func_ov002_0229d2ec: multi-global initialization. Writes halfword 0
 * to arg0+4, sets data_022d1a48.f_20 = 1, data_022d1910.f_ec = 0xffff,
 * data_022d1410.f_618 = -1, data_022d1410.f_61c = -1.
 *
 *     mov   r1, #0x0
 *     mov   r3, #0x1
 *     ldr   r2, .L_0229d320           ; data_022d1a48
 *     strh  r1, [r0, #0x4]
 *     ldr   r1, .L_0229d324           ; data_022d1910
 *     str   r3, [r2, #0x20]
 *     rsb   r2, r3, #0x10000
 *     ldr   r0, .L_0229d328           ; data_022d1410
 *     strh  r2, [r1, #0xec]
 *     sub   r1, r3, #0x2
 *     str   r1, [r0, #0x618]
 *     str   r1, [r0, #0x61c]
 *     bx    lr
 */

typedef struct {
    char         _pad0[0x4];
    unsigned short f_4;
} arg0_0229d2ec_t;

typedef struct {
    char         _pad0[0x20];
    int          f_20;
} state_a_0229d2ec_t;

typedef struct {
    char           _pad0[0xec];
    unsigned short f_ec;
} state_b_0229d2ec_t;

typedef struct {
    char         _pad0[0x618];
    int          f_618;
    int          f_61c;
} state_c_0229d2ec_t;

extern state_a_0229d2ec_t data_ov002_022d1a48;
extern state_b_0229d2ec_t data_ov002_022d1910;
extern state_c_0229d2ec_t data_ov002_022d1410;

void func_ov002_0229d2ec(arg0_0229d2ec_t *p) {
    p->f_4 = 0;
    data_ov002_022d1a48.f_20 = 1;
    data_ov002_022d1910.f_ec = (unsigned short)0xffffu;
    data_ov002_022d1410.f_618 = -1;
    data_ov002_022d1410.f_61c = -1;
}
