/* func_ov002_0220b840: returns 1 iff `data_ov002_022cd3f4.f_8 == 0`.
 *
 *     ldr r0, .L_0220b858
 *     ldr r0, [r0, #0x8]
 *     cmp r0, #0x0
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     bx  lr
 */

typedef struct {
    char _pad[0x8];
    int  f_8;
} state_022cd3f4_t;

extern state_022cd3f4_t data_ov002_022cd3f4;

int func_ov002_0220b840(void) {
    return data_ov002_022cd3f4.f_8 == 0;
}
