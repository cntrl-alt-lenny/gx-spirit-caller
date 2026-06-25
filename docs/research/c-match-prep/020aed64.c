/* CAMPAIGN-PREP candidate for func_020aed64 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BIND base + if-assign min (subhi) + tail copy; reload len for store
 *   risk:       struct offsets guessed (buf@0,cap@4,len@8); unsigned compare (hi) and len*2 scale must hold; reg-alloc on len temp
 *   confidence: med
 */
/* func_020aed64 - bounded halfword append into a buffer struct.
 * struct: { u16 *buf @0; int cap @4; int len @8 }.
 * clamps n so len+n<=cap (unsigned, if-assign min), copies n halfwords
 * to buf+len via func_020ace88, then len += n. src (r1) passes through. */

typedef unsigned short u16;

typedef struct {
    u16 *buf;   /* 0x0 */
    int  cap;   /* 0x4 */
    int  len;   /* 0x8 */
} Buf;

extern void func_020ace88(u16 *dst, const u16 *src, int n);

void func_020aed64(Buf *b, const u16 *src, int n)
{
    int len = b->len;
    if ((unsigned int)(len + n) > (unsigned int)b->cap)
        n = b->cap - len;
    func_020ace88(b->buf + len, src, n);
    b->len = b->len + n;
}
