/* func_02037ae4: brief 111 — P-10 → C-29 promotion via `if (!p)` idiom.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02037ab4
 *     cmp   r0, #0
 *     mvneq r0, #0
 *     ldmeqia sp!, {r3, pc}  ← early return triggered by `!p` (not `p == 0`)
 *     ldr   r0, [r0, #0x34]
 *     mov   r0, r0, lsl #0x10
 *     mov   r0, r0, lsr #0x10
 *     ldmia sp!, {r3, pc}
 *
 * Brief 109 classified P-10 (over-predication of short tail vs early
 * return) as permanent at 75 compiles. Brief 111 ran permuter 1200s +
 * discovered: the recipe is JUST `if (!p)` instead of `if (p == 0)`.
 * Both are semantically identical; mwcc 2.0 compiles them differently
 * — `p == 0` triggers predicated cascade, `!p` triggers early return.
 */

extern void *func_02037ab4(void);

struct s37b34 {
    char _pad[0x34];
    unsigned int f_34;
};

int func_02037ae4(void) {
    struct s37b34 *p = func_02037ab4();
    if (!p) return -1;
    return p->f_34 & 0xffff;
}
