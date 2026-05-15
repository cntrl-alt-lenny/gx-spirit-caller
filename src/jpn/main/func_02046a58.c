/* func_02046a58: returns `data->p ? (unsigned char)data->p->b_2c : 0`.
 *
 *     ldr r0, .L_02046adc
 *     ldr r0, [r0, #0x0]
 *     cmp r0, #0x0
 *     ldrneb r0, [r0, #0x2c]
 *     moveq r0, #0x0
 *     bx  lr
 */

typedef struct {
    char          _pad[0x2c];
    unsigned char b_2c;
} state_0219daec_inner_t;

extern state_0219daec_inner_t *data_0219da0c;

int func_02046a58(void) {
    return data_0219da0c ? data_0219da0c->b_2c : 0;
}
