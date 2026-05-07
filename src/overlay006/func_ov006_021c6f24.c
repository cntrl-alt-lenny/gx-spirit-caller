/* func_ov006_021c6f24: chained pointer test — return 1 iff `p->f_3c &&
 * p->f_40`.
 *
 *     ldr   r1, [r0, #0x3c]
 *     cmp   r1, #0x0
 *     ldrne r0, [r0, #0x40]
 *     cmpne r0, #0x0
 *     movne r0, #0x1
 *     moveq r0, #0x0
 *     bx    lr
 *
 * Short-circuit AND of two pointer tests. Predicated `ldrne` skips
 * the second load when the first test fails.
 */

typedef struct {
    char _pad[0x3c];
    int  f_3c;
    int  f_40;
} state_3c_40_t;

int func_ov006_021c6f24(state_3c_40_t *p) {
    return p->f_3c && p->f_40;
}
