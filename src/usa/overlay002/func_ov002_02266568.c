/* func_ov002_02266568: returns 1 iff `data_ov002_022d008c.f_d38 == 6`.
 *
 *     ldr r0, .L_02266668
 *     ldr r0, [r0, #0xd38]
 *     cmp r0, #0x6
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx  lr
 */

typedef struct {
    char _pad[0xd38];
    int  f_d38;
} state_022d016c_t;

extern state_022d016c_t data_ov002_022d008c;

int func_ov002_02266568(void) {
    return data_ov002_022d008c.f_d38 == 6;
}
