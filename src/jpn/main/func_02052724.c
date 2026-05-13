/* func_02052724: null-checked write to `data_0219e30c.p->f_60c`,
 * return 1 on success, 0 if pointer is null.
 *
 *     ldr r1, .L_020527b4
 *     ldr r1, [r1, #0x0]
 *     cmp r1, #0x0
 *     moveq r0, #0x0
 *     strne r0, [r1, #0x60c]
 *     movne r0, #0x1
 *     bx  lr
 *
 * mwcc collapses the if/else into ARM's predicated execution
 * (no branch).
 */

typedef struct {
    char _pad_0[0x60c];
    int  f_60c;
} state_60c_t;

extern state_60c_t *data_0219e30c;

int func_02052724(int v) {
    state_60c_t *p = data_0219e30c;
    if (p == 0) return 0;
    p->f_60c = v;
    return 1;
}
