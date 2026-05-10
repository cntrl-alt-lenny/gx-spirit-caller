/* func_ov011_021cc7dc: 2-call composition with global field as
 * second arg. Style B with r3-spill push.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov011_021cd6d0
 *     ldr   r1, .L_021cc7f4              ; data_ov011_021d4000
 *     ldr   r1, [r1, #0x2a0]
 *     bl    func_ov011_021cc7a0
 *     ldmia sp!, {r3, pc}
 *  .L_021cc7f4: .word data_ov011_021d4000
 */

extern int func_ov011_021cd6d0(void);
extern int func_ov011_021cc7a0(int x, int y);

typedef struct {
    char _pad[0x2a0];
    int  f_2a0;
} ov011_021d4000_t;

extern ov011_021d4000_t data_ov011_021d4000;

int func_ov011_021cc7dc(void) {
    return func_ov011_021cc7a0(func_ov011_021cd6d0(), data_ov011_021d4000.f_2a0);
}
