/* func_ov005_021abc74: copy 2 fields of *r0 (offsets 0x30 and 0x34) to
 * *r1 and *r2 respectively.
 *
 *     ldr r3, [r0, #0x30]
 *     str r3, [r1, #0x0]
 *     ldr r0, [r0, #0x34]
 *     str r0, [r2, #0x0]
 *     bx  lr
 */

typedef struct {
    char _pad[0x30];
    int  f_30;
    int  f_34;
} state_30_34_t;

void func_ov005_021abc74(state_30_34_t *p, int *out_a, int *out_b) {
    *out_a = p->f_30;
    *out_b = p->f_34;
}
