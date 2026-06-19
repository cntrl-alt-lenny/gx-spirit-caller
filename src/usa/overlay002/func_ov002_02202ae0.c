/* func_ov002_02202ae0: returns 1 iff `data_ov002_022ce1a8.f_5c8 == 0`.
 *
 *     ldr r0, .L_02202be8
 *     ldr r0, [r0, #0x5c8]
 *     cmp r0, #0x0
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx  lr
 */

typedef struct {
    char _pad[0x5c8];
    int  f_5c8;
} state_022ce288_t;

extern state_022ce288_t data_ov002_022ce1a8;

int func_ov002_02202ae0(void) {
    return data_ov002_022ce1a8.f_5c8 == 0;
}
