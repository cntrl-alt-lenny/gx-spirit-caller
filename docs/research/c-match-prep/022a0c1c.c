/* CAMPAIGN-PREP candidate for func_022a0c1c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: max-scan if-assign (movlt pair); a0->f_24 reloaded as loop bound; data_02102c90 reloaded each use; mla tail
 *   risk:       func_02005188 takes 6 args (2 spilled to [sp]/[sp+4] = 4 and 0xc) — my 4-arg decl drops the stack args, so the str [sp]/[sp+4] setup and arg shuffle will diverge. Also data_02102c90 reloaded 5x (not bound). reshape-able (fix signature to 6 args + stack), struct-guessed
 *   confidence: low
 */
/* func_ov002_022a0c1c: scan a0->f_24 candidates, keep the one with max score.
 * best=0; bestScore=0; for i in 0..a0->f_24: id=func_021afbd4(i); if id:
 *   func_0229cfa0(&buf,id); sc=func_020aaddc(&buf); if(bestScore<sc){bestScore=sc;best=id;}
 * Then layout/render via func_0208de4c base + (a0->f_30<<5 ...)<<6, draw via
 * func_02001d0c/func_02005188, returning a glyph-count formula. data_02102c90
 * reloaded each access (NOT bound). */
extern char data_02102c90[];
extern void *func_0208de4c(void);
extern void  func_02001d0c(void *a, int b, int c);
extern void  func_02005188(void *a, int b, void *c, int d);
extern char *func_0202b7cc(int id);
extern int   func_020aaddc(void *p);
extern int   func_ov002_021afbd4(int i);
extern void  func_ov002_0229cfa0(void *dst, char *src);

int func_ov002_022a0c1c(char *a0) {
    char buf[0x100];
    int best = 0, bestScore = 0;
    int i, q;
    int sc, base2, r2;
    char *r5;
    if (*(int *)(a0 + 0x24) > 0) {
        for (i = 0; i < *(int *)(a0 + 0x24); i++) {
            int id = func_ov002_021afbd4(i);
            if (id != 0) {
                func_ov002_0229cfa0(buf, (char *)id);
                sc = func_020aaddc(buf);
                if (bestScore < sc) { bestScore = sc; best = id; }
            }
        }
    }
    r5 = (char *)func_0208de4c() + (((*(int *)(a0 + 0x30) << 5) + 1) << 6);
    func_02001d0c(data_02102c90, 0x12, 0x18);
    func_02005188(data_02102c90, (int)func_0202b7cc(best), r5, 0); /* extra args via stack */
    base2 = *(int *)(data_02102c90 + 0xc);
    r2 = (*(int *)(data_02102c90 + 0x8) != 0) ? 1 : 0;
    q = r2 * 0xc + base2;
    return ((q + 7) >> 3) - 1;
}
