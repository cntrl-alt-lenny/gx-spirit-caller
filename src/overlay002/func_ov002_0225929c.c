/* func_ov002_0225929c: returns `data->f_d4c ? data->f_d48 : 0` (test-and-load
 * variant on the same struct rather than null-deref through a pointer).
 *
 *     ldr r0, .L_022592b4
 *     ldr r1, [r0, #0xd4c]
 *     cmp r1, #0x0
 *     ldrne r0, [r0, #0xd48]
 *     moveq r0, #0x0
 *     bx  lr
 */

typedef struct {
    char _pad_d48[0xd48];
    int  f_d48;
    int  f_d4c;
} state_022d016c_t;

extern state_022d016c_t data_ov002_022d016c;

int func_ov002_0225929c(void) {
    return data_ov002_022d016c.f_d4c ? data_ov002_022d016c.f_d48 : 0;
}
