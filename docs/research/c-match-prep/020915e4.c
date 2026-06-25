/* CAMPAIGN-PREP candidate for func_020915e4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ring fill; min if-assign; reload buf; constant-byte strb
 *   risk:       Single-reg `sub sp,#4` frame may route to legacy_sp3 compiler; signed/unsigned loop compare; `fill` may need int (not char) to avoid an extra extension. Med.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_020915e4 (main, class A).
 * recipe:  ring/FIFO fill (sibling of 02091584). struct { int count; char *buf; }.
 *          clamp = min(count, n); fill `clamp` bytes of buf with constant byte
 *          arg (strb r1,[buf,idx]); then count -= clamp; buf += n.
 *          Prologue `stmfd {lr}; sub sp,#4` / epilogue `add sp,#4; ldmfd {lr}; bx lr`.
 */
typedef struct {
    int   count;   /* +0x0 */
    char *buf;     /* +0x4 */
} Ring020915e4;

void func_020915e4(Ring020915e4 *q, char fill, int n) {
    int clamp;
    int i;
    if (n <= 0)
        return;
    clamp = q->count;
    if (clamp > n)        /* min(count, n) */
        clamp = n;
    for (i = 0; i < clamp; i++)
        q->buf[i] = fill;     /* buf reloaded each iter */
    q->count -= clamp;
    q->buf += n;
}
