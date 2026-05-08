/* func_ov008_021ada90: similar to func_ov008_021aa5d8 — calls
 * func_ov008_021ada0c and stores the result into
 * data_ov008_021b2dc8.f_18.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_ov008_021ada0c
 *     ldr   r1, .L_021adaa4
 *     str   r0, [r1, #0x18]
 *     ldmia sp!, {r3, pc}
 *  .L_021adaa4: .word data_ov008_021b2dc8
 */

extern int func_ov008_021ada0c(void);

typedef struct {
    char _pad[0x18];
    int  f_18;
} ov008_021b2dc8_t;

extern ov008_021b2dc8_t data_ov008_021b2dc8;

void func_ov008_021ada90(void) {
    data_ov008_021b2dc8.f_18 = func_ov008_021ada0c();
}
