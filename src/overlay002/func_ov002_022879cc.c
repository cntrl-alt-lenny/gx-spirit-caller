/* func_ov002_022879cc: C-39 — if pre(self) is non-zero, return
 * func_02280980(bit0) < 0; else return 0. Inverted polarity (brief-253
 * gotcha): body inside the `if` so the pre()==0 path branches to a
 * shared `return 0` epilogue (orig `beq`), not predicated moveq/popeq.
 *
 *     push  {r4, lr}
 *     mov   r4, r0 ; bl func_ov002_0228791c
 *     cmp   r0, #0x0 ; beq .L
 *     ldrh  r0, [r4, #0x2] ; lsl r0, r0, #0x1f ; lsr r0, r0, #0x1f
 *     bl    func_ov002_02280980
 *     cmp   r0, #0x0 ; movlt r0, #0x1 ; movge r0, #0x0 ; pop {r4, pc}
 *  .L: mov r0, #0x0 ; pop {r4, pc}
 */

typedef unsigned short u16;

struct S022879cc {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern int func_ov002_0228791c(struct S022879cc *self);
extern int func_ov002_02280980(int bit0);

int func_ov002_022879cc(struct S022879cc *self) {
    if (func_ov002_0228791c(self) != 0) {
        return func_ov002_02280980(self->bit0) < 0;
    }
    return 0;
}
