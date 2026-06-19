/* func_ov011_021cc718: 2-call composition with global field as
 * second arg. Style B with r3-spill push.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov011_021cd60c
 *     ldr   r1, .L_021cc7f4              ; data_ov011_021d3f20
 *     ldr   r1, [r1, #0x2a0]
 *     bl    func_ov011_021cc6dc
 *     ldmia sp!, {r3, pc}
 *  .L_021cc7f4: .word data_ov011_021d3f20
 */

extern int func_ov011_021cd60c(void);
extern int func_ov011_021cc6dc(int x, int y);

typedef struct {
    char _pad[0x2a0];
    int  f_2a0;
} ov011_021d4000_t;

extern ov011_021d4000_t data_ov011_021d3f20;

int func_ov011_021cc718(void) {
    return func_ov011_021cc6dc(func_ov011_021cd60c(), data_ov011_021d3f20.f_2a0);
}
