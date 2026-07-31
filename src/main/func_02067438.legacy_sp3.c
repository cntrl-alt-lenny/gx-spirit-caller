/* func_02067438: periodic tick/update handler gated on a "now" value
 * from func_02055330(a). Returns immediately if a->field_0 == -1.
 * Otherwise decides between 3 mutually-exclusive func_02066010(a,mode)
 * calls (mode 3, 1, or 0) based on elapsed-time deltas against
 * a->field_ac (all unsigned/wraparound-safe subtraction, magic
 * thresholds 10000/60000), with a special case: when the mode-3 path
 * has already recurred 4+ times (a->field_b8>=4), it instead resets
 * the counter and invokes a per-instance callback (a->field_9c) with
 * (5, &data_02101798, a->field_10c) and returns that result directly.
 * After the mode dispatch, a final elapsed-time check against
 * a->field_b0 either returns the literal 20000 or calls
 * func_02066224(a) and returns its result.
 *
 * sp3 routing: clean 3-reg push {r4,r5,lr} + explicit sub sp,#4 in
 * the .s (no r3-spill), fused pop{regs,pc} epilogue -- the 1.2/sp3
 * signature (docs/research/style-a-epilogue.md), not the default
 * 2.0/sp1p5 tier. Confirmed empirically: the exact same C compiled
 * under 2.0/sp1p5 produces a spurious r3-spill instead of the
 * original's sub sp,#4 pattern; under 1.2/sp3 it reproduces it.
 *
 * .L_174 is reached from two independent origins (b8<=0 directly, OR
 * b8>0-but-delta-too-small) and .L_1d4 similarly merges 3 origins --
 * transcribed with goto (C-55) directly mirroring the disassembly's
 * CFG rather than reconstructed nested if/else, since natural
 * predicate-in-place nesting can't reproduce a genuinely merged label.
 */

typedef struct {
    int field_0;
    char pad_04[0x98];
    int (*field_9c)(int, void *, int);
    char pad_a0[0x0c];
    int field_ac;
    int field_b0;
    int field_b4;
    int field_b8;
    char pad_bc[0x50];
    int field_10c;
} Obj_02067438_t;

extern int func_02055330(Obj_02067438_t *a);
extern int func_02066010(Obj_02067438_t *a, int mode);
extern int func_02066224(Obj_02067438_t *a);
extern int data_02101798;

int func_02067438(Obj_02067438_t *a) {
    int now = func_02055330(a);

    if (a->field_0 == -1) {
        return now;
    }

    if (a->field_b8 <= 0) {
        goto L_174;
    }
    if ((unsigned int) (now - a->field_ac) <= 10000) {
        goto L_174;
    }
    if (a->field_b8 < 4) {
        goto L_158;
    }

    a->field_b8 = 0;
    return a->field_9c(5, &data_02101798, a->field_10c);

L_158:
    func_02066010(a, 3);
    a->field_b8 += 1;
    goto L_1d4;

L_174:
    if (a->field_b4 == 0) {
        goto L_1a4;
    }
    if ((unsigned int) (now - a->field_ac) <= 10000) {
        goto L_1a4;
    }
    func_02066010(a, 1);
    goto L_1d4;

L_1a4:
    if ((unsigned int) (now - a->field_ac) > 60000) {
        goto L_1c8;
    }
    if (a->field_ac == 0) {
        goto L_1c8;
    }
    if ((unsigned int) now >= (unsigned int) a->field_ac) {
        goto L_1d4;
    }

L_1c8:
    func_02066010(a, 0);

L_1d4:
    if ((unsigned int) (now - a->field_b0) <= 20000) {
        return 20000;
    }

    return func_02066224(a);
}
