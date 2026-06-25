/* CAMPAIGN-PREP candidate for func_021b27d8 (ov015, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stack geom[2] (<<12); sel via ==1 if-assign; *b as u16; ret*8 add then *b-=ret
 *   risk:       ov015 catalogues this at 71%: the two leading stack stores (&geom, 0) want a single `stmia sp,{r0,r3}` but mwcc splits the C array/struct init into two `str`. permuter-class for the stmia fusion (a C reshape can't force the store-multiple); also struct-guessed arg3 base index.
 *   confidence: low
 */
/* func_ov015_021b27d8 (ov015, class C): stack-struct setup + two calls; spill/reg-alloc.
 * f1c/f1e are signed 16-bit, each <<12 into a stack pair (sp+0xc, sp+0x10).
 * func_ov015_021b28a8(o)==1 ? sel=1 : 0, then o[sel] indexes a word base for arg3.
 * *b read as unsigned 16-bit (lsl#16;lsr#16). The two leading stack stores
 * (&geom, 0) are emitted as `stmia sp,{r0,r3}` in the orig. After the call:
 * *a += ret*8 ; *b -= ret. func_0207f934 takes 3 reg args + a stack block. */

extern int  func_0207f934(int pa, unsigned int pb, int sel_word, void *geom, int z0, int z1);
extern int  func_ov015_021b28a8(char *o);

void func_ov015_021b27d8(char *o, int *a, int *b) {
    int geom[2];
    int sel;
    int ret;

    geom[0] = (int)(*(short *)(o + 0x1c)) << 12;
    geom[1] = (int)(*(short *)(o + 0x1e)) << 12;

    sel = (func_ov015_021b28a8(o) == 1) ? 1 : 0;

    ret = func_0207f934(*a,
                        (unsigned short)*b,
                        *(int *)(o + sel * 4),
                        geom, 0, 0);

    *a = *a + (ret << 3);
    *b = *b - ret;
}
