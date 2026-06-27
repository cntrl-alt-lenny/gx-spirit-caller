/* CAMPAIGN-PREP candidate for func_0224b01c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 id + fA*2+bit13 packed; C: slot ptr bound once, id-first decl, reload word for packed
 *   risk:       orig reloads [r7,r5,lsl#2] for the packed key (id read earlier from a separate load); mwcc may CSE the word into one ldr. bind/reload flip is reshape-able (keep two distinct *(u32*)slot reads), but bit13 add-fusion residue is permuter-class.
 *   confidence: med
 */
/* func_ov002_0224b01c: straight-line — read :13 id from per-player word
 * [base+0x120+arg2*4]; require 0202e234(id); compute packed key
 * fieldA*2+bit13 of the SAME word and bail if 021c38c4(self,key) > 4;
 * require 021ca440(self,id); post 02253458(self,0xb,arg2). cls D: mla
 * base + :13 + packed-arg, two predicate calls. */

typedef unsigned int u32;

struct R0224b01c { u32 id : 13; u32 : 9; u32 fA : 8; u32 : 2; };

extern char data_ov002_022cf16c[];

extern int  func_0202e234(int id);
extern int  func_ov002_021c38c4(int self, int packed);
extern int  func_ov002_021ca440(int self, int id);
extern int  func_ov002_02253458(int a, int b, int c);

int func_ov002_0224b01c(int arg0, int arg1, int arg2) {
    char *slot;
    int id;
    int packed;
    slot = data_ov002_022cf16c + (arg0 & 1) * 0x868 + 0x120 + arg2 * 4;
    id = ((struct R0224b01c *)slot)->id;
    if (func_0202e234(id) == 0)
        return 0;
    packed = ((struct R0224b01c *)slot)->fA * 2 +
             (int)((u32)(*(u32 *)slot << 18) >> 31);
    if (func_ov002_021c38c4(arg0, packed) > 4)
        return 0;
    if (func_ov002_021ca440(arg0, id) == 0)
        return 0;
    func_ov002_02253458(arg0, 0xb, arg2);
    return 0;
}
