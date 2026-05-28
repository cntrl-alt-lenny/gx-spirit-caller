/* func_0208b0a4: 4-field-write thunk with helper.
 *
 *     push  {r4, r5, r6, lr}
 *     mov   r6, r0
 *     mov   r5, r1
 *     mov   r4, r2
 *     bl    helper(self)
 *     str   r0, [r6]
 *     str   r5, [r6, #4]
 *     str   r4, [r6, #12]
 *     mov   r0, #0
 *     str   r0, [r6, #8]
 *     pop
 *
 * Brief 244 pattern 8 (stmia fusion miss). NOT a reg-alloc issue —
 * mwcc 2.0/sp1p5 FUSES str r0,[r6] + str r5,[r6,#4] into
 * `stm r6, {r0, r5}` (10 insns). Orig has 4 separate strs (11 insns).
 * mwcc 1.2/sp3 does NOT fuse — routes via `*.legacy_sp3.c`. Same
 * gotcha 10 family as brief 242 sub-shape 4.
 */
struct Func0208b0a4Self { int f0; int f4; int f8; int f12; };

extern int func_0208b070(struct Func0208b0a4Self *self);

void func_0208b0a4(struct Func0208b0a4Self *self, int arg1, int arg2) {
    self->f0 = func_0208b070(self);
    self->f4 = arg1;
    self->f12 = arg2;
    self->f8 = 0;
}
