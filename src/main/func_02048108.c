/* func_02048108: returns `data->p ? data->p->f_1c : 0`.
 * Same shape as func_020469b4 on a different data global, different offset.
 *
 *     ldr r0, .L_02048120
 *     ldr r0, [r0, #0x0]
 *     cmp r0, #0x0
 *     ldrne r0, [r0, #0x1c]
 *     moveq r0, #0x0
 *     bx  lr
 */

typedef struct {
    char _pad[0x1c];
    int  f_1c;
} state_0219dc78_inner_t;

extern state_0219dc78_inner_t *data_0219dc78;

int func_02048108(void) {
    return data_0219dc78 ? data_0219dc78->f_1c : 0;
}
