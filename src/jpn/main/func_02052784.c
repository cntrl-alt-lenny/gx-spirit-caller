/* func_02052784: same shape as func_02052724 on f_600.
 *
 *     ldr r1, .L_02052814
 *     ldr r1, [r1, #0x0]
 *     cmp r1, #0x0
 *     moveq r0, #0x0
 *     strne r0, [r1, #0x600]
 *     movne r0, #0x1
 *     bx  lr
 */

typedef struct {
    char _pad_0[0x600];
    int  f_600;
} state_600_t;

extern state_600_t *data_0219e30c;

int func_02052784(int v) {
    state_600_t *p = data_0219e30c;
    if (p == 0) return 0;
    p->f_600 = v;
    return 1;
}
