/* CAMPAIGN-PREP candidate for func_022550b8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C+D: id:13 bitfield (lsl19;lsr19+movs), two lockstep char* cursors +=0x14 (idp=base+0x30, flp=base), (f40>>2)|(f40>>1) operand-first
 *   risk:       reshape-able: orig keeps idp in r5 and flp in r6 as separate induction pointers; if mwcc fuses to one base + i*0x14 (mla) the two adds collapse. Two-cursor char* form steers this but is the main lever.
 *   confidence: med
 */
/* func_ov002_022550b8: scan 5 sub-rows of player (arg0&1)'s 0x868 block.
 * block = data_ov002_022cf16c + (arg0&1)*0x868. Two lockstep cursors stride
 * 0x14: idp = block+0x30 (->id:13), flp = block (reads u16@+0x38, u32@+0x40).
 * For row i in 0..4: if id!=0 && f38!=0 && !((f40>>2|f40>>1)&1) && the
 * guard 021c93cc(arg0,i,1)==0 -> return 1; else continue. Returns 0. */
extern char data_ov002_022cf16c[];
extern int  func_ov002_021c93cc(int a, int b, int bit);

struct Ov002SlotId { unsigned int id : 13; };

int func_ov002_022550b8(int arg0) {
    char *flp = data_ov002_022cf16c + (arg0 & 1) * 0x868;
    char *idp = flp + 0x30;
    int i;
    unsigned int f40;

    for (i = 0; i <= 4; i++) {
        if (((struct Ov002SlotId *)idp)->id != 0 &&
            *(unsigned short *)(flp + 0x38) != 0) {
            f40 = *(unsigned int *)(flp + 0x40);
            if ((((f40 >> 2) | (f40 >> 1)) & 1) == 0) {
                if (func_ov002_021c93cc(arg0, i, 1) == 0)
                    return 1;
            }
        }
        idp += 0x14;
        flp += 0x14;
    }
    return 0;
}
