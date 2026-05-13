/* func_02052744: same shape as func_02052724 on f_608.
 *
 *     ldr r1, .L_020527d4
 *     ldr r1, [r1, #0x0]
 *     cmp r1, #0x0
 *     moveq r0, #0x0
 *     strne r0, [r1, #0x608]
 *     movne r0, #0x1
 *     bx  lr
 */

typedef struct {
    char _pad_0[0x608];
    int  f_608;
} state_608_t;

extern state_608_t *data_0219e30c;

int func_02052744(int v) {
    state_608_t *p = data_0219e30c;
    if (p == 0) return 0;
    p->f_608 = v;
    return 1;
}
