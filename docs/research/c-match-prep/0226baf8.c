/* CAMPAIGN-PREP candidate for func_0226baf8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two return-0 guards; mla *0x868 + add arg2*4 + load@0x120; :13 bitfield arg
 *   risk:       Addressing shape: orig is mla(base,arg0&1,0x868); add r0,r2,lsl#2; ldr[+0x120]. mwcc may fold arg2*4+0x120 differently or reorder. reshape-able (keep arg2*4 as the only variable term).
 *   confidence: med
 */
/* func_ov002_0226baf8 (ov002, cls C) — guard (player must differ, kind==11),
 * read a :13 slot id from the per-player table, gate a call on it.
 *   if (arg0 == *(int*)(d016c+0xd94)) return 0;
 *   if (arg1 != 11) return 0;
 *   v = ((Ov002Slot*)(cf16c + (arg0&1)*0x868 + arg2*4 + 0x120))->id;
 *   return func_0202e328(v) ? 0x800 : 0;
 * mla from the 0x868 array stride; arg2*4 is a separate add; +0x120 folds
 * into the load. id is a :13 BITFIELD feeding a call arg (plain lsr, no movs). */
typedef unsigned char  u8;
typedef unsigned short u16;
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern int  func_0202e328(int a);
int func_ov002_0226baf8(int arg0, int arg1, int arg2) {
    int v;
    if (arg0 == *(int *)(data_ov002_022d016c + 0xd94))
        return 0;
    if (arg1 != 0xb)
        return 0;
    v = ((struct Ov002Slot *)(data_ov002_022cf16c + (arg0 & 1) * 0x868 +
                              arg2 * 4 + 0x120))->id;
    if (func_0202e328(v))
        return 0x800;
    return 0;
}
