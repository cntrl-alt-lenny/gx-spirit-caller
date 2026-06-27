/* CAMPAIGN-PREP candidate for func_022b8430 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: :1/:5/:8 unsigned bitfield struct -> lsl;lsr extract pairs; store-order.
 *   risk:       Stack arg layout: stmdb {r0-r3} spills incoming args then re-reads [sp,#0x14]/[sp,#0x18] as halfwords - the C param signature (which slots are the bitfields) is struct-guessed; bitfield-vs-mask extract is reshape-able.
 *   confidence: low
 */
/* func_ov002_022b8430 - twin bitfield-extract setter. Reads two halfword
 * args off the stack (incoming args spilled by stmdb {r0-r3}); each is a
 * packed bitfield h = {:1, :5, :8}. Extracts via lsl;lsr pairs
 * (h<<0x1f>>0x1f -> :1, h<<0x1a>>0x1b -> :5, h<<0x12>>0x18 -> :8) and
 * calls func_ov002_022b867c(base, f1, f5, f8, base+0x..+0xc00) twice.
 * Also strh's the raw halfword into base+0xc00+0x6a / +0x6c. */

struct bf_8430 {
    unsigned short a : 1;
    unsigned short b : 5;
    unsigned short c : 8;
};

extern void func_ov002_022b867c(void *base, int f1, int f5, int f8, void *extra);

int func_ov002_022b8430(char *base, int arg1, int arg2,
                        struct bf_8430 h0, struct bf_8430 h1)
{
    *(unsigned short *)(base + 0xc00 + 0x6a) = *(unsigned short *)&h0;
    func_ov002_022b867c(base, h0.a, h0.b, h0.c, base + 0x8c + 0xc00);

    *(unsigned short *)(base + 0xc00 + 0x6c) = *(unsigned short *)&h1;
    func_ov002_022b867c(base, h1.a, h1.b, h1.c, base + 0x98 + 0xc00);
    return 1;
}
