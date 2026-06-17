/* func_02087440: sp3 routing — null-check + `helper(1 << self->f0)`.
 *
 *     stmfd sp!, {lr}
 *     sub   sp, sp, #4
 *     ldr   r2, [r0, #8]
 *     cmp   r2, #0
 *     addeq sp, sp, #4
 *     ldmfdeq sp!, {pc}
 *     ldr   r0, [r0]
 *     mov   r2, #1
 *     lsl   r0, r2, r0
 *     bl    helper
 *     add   sp, sp, #4
 *     ldmfd sp!, {pc}
 *
 * Brief 246: rescued from brief 245's escape list. Brief 245
 * misdiagnosed this as an objdiff scoring quirk — actual issue is a
 * reg-alloc divergence (r1 vs r2 for the temp). Standard gotcha 7
 * application with a 2-arg pass-through to the helper.
 */
struct Func02087528Self { int f0; int pad4; int f8; };

extern void func_02094df4(int x, int arg);

void func_02087440(struct Func02087528Self *self, int arg) {
    if (self->f8 == 0) return;
    func_02094df4(1 << self->f0, arg);
}
