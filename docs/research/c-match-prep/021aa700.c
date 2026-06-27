/* CAMPAIGN-PREP candidate for func_021aa700 (ov020, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: inline idx*14 + sub*2 word index (don't bind shared base+idx*S); ldmia -> e[0],e[1]; movs r4,r2 -> `if(sub==0)` eq-return r7.
 *   risk:       struct-guessed: the *14 (idx*56/4) stride, the +0xa94 ptr field, and the two stack buffer sizes (0x48/0x40 vs sub 0x88) are inferred; `strleb r0,[r4]` (byte store 0) on the r7<=0 path. reshape-able if offsets confirmed.
 *   confidence: med
 */
// func_ov020_021aa700 : base[idx*56 + sub*8] ldmia 2 words, guarded nested calls
extern int   func_02038ad4(void *buf, char *out, int n);
extern void  func_02092904(char *out, int v);
extern void  func_02097ea4(void *buf, int a, int b);
extern void  func_02097ff0(void *buf);
extern void  func_02098038(void *dst, void *src);
extern void  func_02098388(void *buf);
extern void  func_ov020_021aa67c(void *dst, int sub1);
struct Pair20 { int x; int y; };
struct G20 { char pad[0xa94]; struct Pair20 *tbl; };
extern struct G20 data_ov020_021ae060;       // _LIT0, ptr at +0xa94

int func_ov020_021aa700(int idx, int sub, char *out)
{
    char buf[0x48];
    char src[0x40];
    int *base = (int *)data_ov020_021ae060.tbl;
    int *e = base + idx * 14 + sub * 2;       // *56 + *8 bytes -> word index *14 + *2
    int r6 = e[0];
    int r7 = e[1];

    if (sub == 0) return r7;                   // movs r4,r2 ; eq path returns r7
    if (r7 <= 0) { *out = 0; return r7; }

    func_02098388(buf);
    func_ov020_021aa67c(src, sub + 1);
    func_02098038(buf, src);
    func_02097ea4(buf, r6, 0);
    func_02092904(out, 0x200);
    func_02038ad4(buf, out, r7);
    func_02097ff0(buf);
    return r7;
}
