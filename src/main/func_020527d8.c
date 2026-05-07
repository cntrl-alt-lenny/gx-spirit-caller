/* func_020527d8: same shape as func_02052798 on f_604.
 *
 *     ldr r1, .L_020527f4
 *     ldr r1, [r1, #0x0]
 *     cmp r1, #0x0
 *     moveq r0, #0x0
 *     strne r0, [r1, #0x604]
 *     movne r0, #0x1
 *     bx  lr
 */

typedef struct {
    char _pad_0[0x604];
    int  f_604;
} state_604_t;

extern state_604_t *data_0219e3ec;

int func_020527d8(int v) {
    state_604_t *p = data_0219e3ec;
    if (p == 0) return 0;
    p->f_604 = v;
    return 1;
}
