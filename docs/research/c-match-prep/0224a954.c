/* CAMPAIGN-PREP candidate for func_0224a954 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13/[22:29]/bit13 packed math; C: hold base, ip used for w<<18 temp like orig
 *   risk:       packed bit13 fused into add (add r3,r3,ip,lsr#31) and id NOT held (orig reloads [r8] twice). mwcc may CSE the word load or hoist bit13 to its own reg. bind/reload + operand-fusion, permuter-class.
 *   confidence: low
 */
/* func_ov002_0224a954: scan the per-player +0x260 record list (count at
 * base[0x10]); for each record whose :13 id passes 0202e234, if
 * 021b3fd8(self,0xb,0x12a1, fieldA*2+bit13)==0 post 02253458(self,0xd,i).
 * cls D: :13 / [22:29] / bit13 packed math, reg-reuse loop (lean variant
 * of 0224a038, no 0202b878/8a8/021ca440 guards). */

typedef unsigned int u32;

struct R0224a954 { u32 id : 13; u32 : 9; u32 fA : 8; u32 : 2; };

extern char data_ov002_022cf16c[];
extern int  data_ov002_022cf17c[];

extern int  func_0202e234(int id);
extern int  func_ov002_021b3fd8(int self, int k, int code, int packed);
extern int  func_ov002_02253458(int a, int b, int c);

void func_ov002_0224a954(int arg0) {
    char *base;
    char *rec;
    int i;
    int packed;
    if (*(int *)((char *)data_ov002_022cf17c + (arg0 & 1) * 0x868) == 0)
        return;
    base = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    rec = base + 0x260;
    i = 0;
    do {
        if (func_0202e234(((struct R0224a954 *)rec)->id) != 0) {
            packed = ((struct R0224a954 *)rec)->fA * 2 +
                     (int)((u32)(*(u32 *)rec << 18) >> 31);
            if (func_ov002_021b3fd8(arg0, 0xb, 0x12a1, packed) == 0)
                func_ov002_02253458(arg0, 0xd, i);
        }
        i++;
        rec += 4;
    } while (i < *(int *)(base + 0x10));
}
