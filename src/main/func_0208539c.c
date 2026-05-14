/* func_0208539c: iterate i = 0..(arg0->f_18 - 1) and call func_0208541c
 * on each index. Returns void; early-exits when f_18 is zero.
 *
 *     stmfd sp!, {r4, r5, r6, lr}
 *     mov   r6, r0                ; r6 = arg0
 *     ldrb  r0, [r6, #0x18]
 *     mov   r5, r1                ; r5 = arg1
 *     mov   r4, #0                ; i = 0
 *     cmp   r0, #0
 *     ldmlsfd sp!, {r4, r5, r6, pc} ; early-return when arg0->f_18 == 0
 * .L_loop:
 *     mov   r0, r6                ; helper(arg0, i, arg1)
 *     mov   r1, r4
 *     mov   r2, r5
 *     bl    func_0208541c
 *     ldrb  r0, [r6, #0x18]
 *     add   r4, r4, #1
 *     cmp   r4, r0
 *     bcc   .L_loop
 *     ldmfd sp!, {r4, r5, r6, pc}
 *
 * 16 insns = 0x40 bytes. Sibling func_020853dc calls func_02085460
 * instead (same shape, different helper).
 *
 * f_18 is `u8` so the loop reload uses `ldrb`. The early-return uses
 * `ls` (unsigned <=) which collapses to "== 0" since r0 is unsigned.
 */

#include <nitro/types.h>

typedef struct {
    u8 _pad[0x18];
    u8 f_18;
} state_0208539c_t;

extern void func_0208541c(state_0208539c_t *p, int i, int arg2);

void func_0208539c(state_0208539c_t *p, int arg1) {
    u32 i;
    for (i = 0; i < p->f_18; i++) {
        func_0208541c(p, i, arg1);
    }
}
