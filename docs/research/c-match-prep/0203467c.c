/* CAMPAIGN-PREP candidate for func_0203467c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     small-struct {r0,r1} by-value return; func_02031c1c also returns Pair; (b==0&&a==0) order
 *   risk:       8-byte struct-return ABI (r0:r1) is struct-guessed: if mwcc returns via sret pointer instead of r0:r1, prologue/epilogue diverge entirely. Confirm Pair return passes in regs. Also f10/f14 offset order on early path.
 *   confidence: low
 */
/* func_0203467c (main, class C) — alloc/init dispatch, returns 2-word struct {r0,r1}.
 * func_02034184()? return {[ret+0x10],[ret+0x14]} : alloc(0x48c) + func_02031c1c(...) two-word result. */
typedef struct { void *a; void *b; } Pair_0203467c;

typedef struct {
    unsigned char _pad_00[0x10];
    void *f10;            /* +0x10 */
    void *f14;            /* +0x14 */
} Hnd_0203467c;

extern Hnd_0203467c *func_02034184(void);
extern void  *func_02031d80(int id, int a, int b);
extern void   func_02031d0c(void *h);
extern void   func_02034574(void);
extern void   func_02034548(void);
extern void   func_02034754(void *h, int id);
extern Pair_0203467c func_02031c1c(void *h, int a, int b, void *cb1, void *cb2);
extern int    func_020345c0(void *h);

Pair_0203467c func_0203467c(void)
{
    Pair_0203467c res;
    Hnd_0203467c *h = func_02034184();
    if (h != 0) {
        res.a = h->f10;
        res.b = h->f14;
        return res;
    }
    {
        void *blk = func_02031d80(0x48c, 0x200000, 0x5000000);
        if (blk == 0) {
            res.a = 0;
            res.b = 0;
            return res;
        }
        func_02034754(blk, 0x48c);
        res = func_02031c1c(blk, 0x200000, 0x5000000, (void *)func_02034574, (void *)func_02034548);
        if (res.b == 0 && res.a == 0) {
            func_02031d0c(blk);
            res.a = 0;
            res.b = 0;
        } else if (func_020345c0(blk) < 0) {
            func_02031d0c(blk);
            res.a = 0;
            res.b = 0;
        }
    }
    return res;
}
