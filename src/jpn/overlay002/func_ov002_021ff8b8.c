/* func_ov002_021ff8b8: returns 1 iff `data_ov002_022d008c.f_cf8 != 3`.
 *
 *     ldr r0, .L_021ff9c0
 *     ldr r0, [r0, #0xcf8]
 *     cmp r0, #0x3
 *     movne r0, #0x1
 *     moveq r0, #0x0
 *     bx  lr
 */

typedef struct {
    char _pad[0xcf8];
    int  f_cf8;
} state_022d016c_t;

extern state_022d016c_t data_ov002_022d008c;

int func_ov002_021ff8b8(void) {
    return data_ov002_022d008c.f_cf8 != 3;
}
