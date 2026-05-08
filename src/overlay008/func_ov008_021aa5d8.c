/* func_ov008_021aa5d8: overlay-internal store helper. Calls
 * func_020097f0 and stores the result into
 * data_ov008_021b2780.f_c.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_020097f0
 *     ldr   r1, .L_021aa5ec
 *     str   r0, [r1, #0xc]
 *     ldmia sp!, {r3, pc}
 *  .L_021aa5ec: .word data_ov008_021b2780
 */

extern int func_020097f0(void);

typedef struct {
    char _pad[0xc];
    int  f_c;
} ov008_021b2780_t;

extern ov008_021b2780_t data_ov008_021b2780;

void func_ov008_021aa5d8(void) {
    data_ov008_021b2780.f_c = func_020097f0();
}
