/* CAMPAIGN-PREP candidate for func_0220a008 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two guard calls; bls/bcc unsigned loop; bound reloaded each iter as r1 + arg2
 *   risk:       struct-guessed/reshape-able: 022536e8 arg2 maps to live r1 (the reloaded bound). If the real arg2 differs (e.g. a 4th arg or different member), the mov r1 path diverges; confirm 022536e8 arity and the +0xc vs first-count member.
 *   confidence: low
 */
/* func_ov002_0220a008 (ov002, class C, MED) -- batch p_0086.
 * guard 021ff3bc(self); guard 021ff320(self,arg); p=self->f2.p;
 * n = ((Field*)(cf178 + p*0x868))->m0  (first count member, stride 0x868);
 * loop i=0; while(i<bound): if 022536e8(self->f0, bound, i) return 1;
 *   bound reloaded each iter as ((Field*)(cf16c + p*0x868))->cnt0xC.
 * NOTE: arg2 of 022536e8 is the reloaded bound (orig leaves prev r1 live).
 */
typedef unsigned short u16;
typedef unsigned char  u8;

struct Self0220a008 { u16 f0; struct { u16 p : 1; u16 _r : 15; } f2; };
struct Field0220a008 { u8 _a[0xc]; int cnt; };           /* cf16c+0xc */

extern u8 data_ov002_022cf178[]; /* alias: count, stride 0x868 */
extern u8 data_ov002_022cf16c[]; /* field base, stride 0x868 */
extern int  func_ov002_021ff3bc(struct Self0220a008 *self);
extern int  func_ov002_021ff320(struct Self0220a008 *self, int arg);
extern int  func_ov002_022536e8(unsigned int f0, int bound, int i);

int func_ov002_0220a008(struct Self0220a008 *self, int arg) {
    int p;
    int n;
    int i;
    if (func_ov002_021ff3bc(self) == 0) return 0;
    if (func_ov002_021ff320(self, arg) == 0) return 0;
    p = self->f2.p;
    n = *(int *)(data_ov002_022cf178 + (p & 1) * 0x868);
    i = 0;
    while ((unsigned int)i < (unsigned int)n) {
        if (func_ov002_022536e8(self->f0, n, i)) return 1;
        i++;
        n = ((struct Field0220a008 *)(data_ov002_022cf16c + (p & 1) * 0x868))->cnt;
    }
    return 0;
}
