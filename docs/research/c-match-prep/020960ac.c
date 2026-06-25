/* CAMPAIGN-PREP candidate for func_020960ac (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     list-unlink 4 buckets; hoist 0x3c/8 to r4/r8, bind self r5, base r7 (class C)
 *   risk:       orig hoists 0x3c and 8 into callee-saved r4/r8 and self=base+0x18 into r5, all live across the i-loop and func_020928e8 calls; if mwcc rematerializes them per-iteration the inner adds diverge. b+0x18/b+0x1c reloaded each iter (asm recomputes base+i*8 twice). struct-guessed. permuter-class on the const hoist.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_020960ac (main, class C) — MED tier.
 * UNVERIFIED build-free draft.
 *   recipe:  list-unlink over 4 buckets; hoist consts 0x3c/8 and self-ptr r5
 *   class C: bind r7=base, r5=&base[0x18], r8=8, r4=0x3c across the loop
 * struct-guessed: 4 buckets stride 8 at base+0x18: {next@0x18, val@0x1c}; node {?, next@0x4 ... link@0x18}.
 */
/* func_020960ac: r7=base. self = base+0x18.
 *   func_020952e4();
 *   for (i=0;i<4;i++){ b=&base[i*8 ... actually base + i*8];
 *       n = *(void**)(b+0x18); if (!n) continue;
 *       if (*(void**)((char*)n+0x18) == self){
 *           *(void**)((char*)n+0x18) = *(void**)(b+0x1c);
 *           func_020928e8(n, 0x3c);
 *       } else {
 *           q = *(void**)((char*)n+0x18);
 *           while (q && *(void**)((char*)q+4) != self) q = *(void**)((char*)q+4);
 *           *(void**)((char*)q+4) = *(void**)(b+0x1c);
 *           func_020928e8(q, 8);
 *       }
 *   }
 *   func_020952d0();
 * Consts 8 and 0x3c are preloaded into r8/r4 before the loop (callee-saved). */

extern void func_020928e8(void *p, int len);
extern void func_020952d0(void);
extern void func_020952e4(void);

void func_020960ac(unsigned char *base)
{
    void *self = base + 0x18;
    int i;

    func_020952e4();
    for (i = 0; i < 4; i++) {
        unsigned char *b = base + i * 8;
        unsigned char *n = *(unsigned char **)(b + 0x18);
        if (n == 0)
            continue;
        if (*(void **)(n + 0x18) == self) {
            *(void **)(n + 0x18) = *(void **)(b + 0x1c);
            func_020928e8(n, 0x3c);
        } else {
            unsigned char *q = *(unsigned char **)(n + 0x18);
            while (q != 0 && *(void **)(q + 4) != self)
                q = *(unsigned char **)(q + 4);
            *(void **)(q + 4) = *(void **)(b + 0x1c);
            func_020928e8(q, 8);
        }
    }
    func_020952d0();
}
