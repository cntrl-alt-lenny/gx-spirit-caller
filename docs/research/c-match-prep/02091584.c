/* CAMPAIGN-PREP candidate for func_02091584 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ring copy; min via if-assign; reload buf; signed-char ldrsb
 *   risk:       Signed vs unsigned loop compare (orig uses bls/bcc unsigned — count/clamp may be unsigned); struct field offsets/types guessed; min if-assign should match. Med.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02091584 (main, class A).
 * recipe:  ring/FIFO copy. struct { int count; signed char *buf; } at +0/+4.
 *          clamp = min(count, n) via if-assign (cmp;movhi); copy `clamp` signed
 *          bytes src->buf (ldrsb), reloading buf each iteration; then
 *          count -= clamp; buf += n. Unsigned loop bounds (bls/bcc).
 */
typedef struct {
    int          count;   /* +0x0 */
    signed char *buf;     /* +0x4 */
} Ring02091584;

void func_02091584(Ring02091584 *q, const signed char *src, int n) {
    int clamp;
    int i;
    if (n <= 0)
        return;
    clamp = q->count;
    if (clamp > n)        /* movhi: clamp = min(count, n) */
        clamp = n;
    for (i = 0; i < clamp; i++)
        q->buf[i] = src[i];   /* buf reloaded each iter (ldr [r0,#4] in loop) */
    q->count -= clamp;
    q->buf += n;
}
