/* func_02087d6c: double early-return guard on a cached self-pointer,
 * then a tail call passing a pointer into the inner struct (self+0x1c),
 * a shifted arg1, and a forwarded (unmodeled) 3rd argument.
 *
 * "Hidden-arg liveness" lever: func_0208afbc genuinely takes 3 args
 * (see func_0208afbc.legacy_sp3.c: void func_0208afbc(struct
 * Func0208b0a4Self *self, int arg1, int arg2)). The lone caller of
 * this function (func_02037cd8.s) forwards its own 3rd parameter into
 * r2 right up to this function's call site, and the other 2 real
 * call sites of func_0208afbc (func_02087794.s explicit r2 set;
 * func_0208786c.s r1->r2 forward at entry) confirm arg2 is a real,
 * live parameter, not a compiler-invented temp. Modeling it here
 * keeps r2 live across the guard chain, bumping the cached
 * self-pointer from r2 (prior near-miss, verified empirically:
 * DIFF at insns [2][3][6][10], every diff a straight r2-vs-r3 swap,
 * insn count matched 15v15) up to r3 (target) — a full byte-exact
 * fix, not just a partial nudge.
 *
 * Only mwcc 1.2/sp3 (`.legacy_sp3.c`) reproduces the prologue shape
 * (`stmfd sp!,{lr}; sub sp,sp,#4` / `add sp,sp,#4; ldmfd sp!,{pc}`
 * Style-B epilogue); 2.0/sp1p5 and 1.2/sp2p3 both emit a different,
 * non-matching insn sequence/count. Same routing tier as the callee.
 */

typedef struct InnerE54Full {
    char _pad_00[0x1c];
    short field_1c;          /* +0x1c (passed by address) */
    char _pad_1e[0x2c - 0x1e];
    unsigned char byte_2c;   /* +0x2c */
} InnerE54Full;

typedef struct EntE54 {
    InnerE54Full *field_0;   /* +0x00 */
} EntE54;

extern void func_0208afbc(void *p, int arg1, int arg2);

void func_02087d6c(EntE54 *p, int arg1, int arg2) {
    InnerE54Full *q = p->field_0;

    if (q == 0) return;
    if (q->byte_2c == 2) return;
    func_0208afbc(&q->field_1c, arg1 << 8, arg2);
}
