/* func_02046948: returns `data->p ? data->p->f_24 : 0` (null-checked deref).
 *
 *     ldr r0, .L_020469cc
 *     ldr r0, [r0, #0x0]
 *     cmp r0, #0x0
 *     ldrne r0, [r0, #0x24]
 *     moveq r0, #0x0
 *     bx  lr
 */

typedef struct {
    char _pad[0x24];
    int  f_24;
} state_0219daec_inner_t;

extern state_0219daec_inner_t *data_0219da0c;

int func_02046948(void) {
    return data_0219da0c ? data_0219da0c->f_24 : 0;
}
