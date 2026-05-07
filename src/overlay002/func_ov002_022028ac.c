/* func_ov002_022028ac: returns 1 iff `data_ov002_022d016c.f_cf8 == 2`.
 *
 *     ldr r0, .L_022028c4
 *     ldr r0, [r0, #0xcf8]
 *     cmp r0, #0x2
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx  lr
 */

typedef struct {
    char _pad[0xcf8];
    int  f_cf8;
} state_022d016c_t;

extern state_022d016c_t data_ov002_022d016c;

int func_ov002_022028ac(void) {
    return data_ov002_022d016c.f_cf8 == 2;
}
