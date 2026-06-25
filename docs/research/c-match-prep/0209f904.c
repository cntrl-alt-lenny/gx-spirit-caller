/* CAMPAIGN-PREP candidate for func_0209f904 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     shift-mask (1<<c) dual-halfword guard chain + tail call
 *   risk:       tail-call arg list inferred from reg residency (r1=b->h0, r2=b+4, r3=c); if f8c8 takes b not b->h0 it mismatches
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0209f904 (main, class B) — front-load.
 * UNVERIFIED build-free draft.
 *   recipe:     shift-mask (1<<c) guard chain over two halfwords + tail call; b->h0 loaded once (guard AND 2nd arg)
 *   risk:       2nd tail-call arg = b->h0 (left in r1), 3rd = &b->f4 (b+4), 4th = c (r3) — arg shape inferred from reg residency
 */
extern int func_0209f8c8(int a, int h0, void *p, int c);

struct B { unsigned short h0; unsigned short h2; char f4[1]; };

int func_0209f904(int a, struct B *b, int c) {
    int mask = 1 << c;
    if (a == 0) return 0;
    if (b == 0) return 0;
    if ((b->h0 & mask) == 0) return 0;
    if ((b->h2 & mask) == 0) return 0;
    return func_0209f8c8(a, b->h0, &b->f4, c);
}
