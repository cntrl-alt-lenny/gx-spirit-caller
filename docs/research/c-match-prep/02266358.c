/* CAMPAIGN-PREP candidate for func_02266358 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl p before i; :13 bitfield; mla via *0x868; pointer-walk +=0x14
 *   risk:       0x151e held in callee-saved r5 across loop (orig hoists the const load); if mwcc rematerializes it each iteration the loop body diverges. reshape-able (hoist into a local before the loop).
 *   confidence: med
 */
/* func_ov002_02266358 (ov002, cls C) — scan a per-player 0x14-stride slot
 * array for the first :13 id that's set, ask the sink, return its index.
 *   p = cf16c + (arg0&1)*0x868 + 0x30;  for(i=0;i<=4;i++){
 *     if(((Ov002Slot*)p)->id) if(func_021b4120(arg0,i,0x151e)==0) return i;
 *     p+=0x14; } return -1;
 * The 0x868 array stride yields the mla; the slot id is a :13 BITFIELD
 * (lsl#19;lsr#19), never (v<<19)>>19 (mwcc folds that to & 0x1fff). */
typedef unsigned char  u8;
typedef unsigned short u16;
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern int  func_ov002_021b4120(int a, int b, int c);
int func_ov002_02266358(int arg0) {
    char *p;
    int i;
    p = data_ov002_022cf16c + (arg0 & 1) * 0x868 + 0x30;
    for (i = 0; i <= 4; i++) {
        if (((struct Ov002Slot *)p)->id) {
            if (func_ov002_021b4120(arg0, i, 0x151e) == 0)
                return i;
        }
        p += 0x14;
    }
    return -1;
}
