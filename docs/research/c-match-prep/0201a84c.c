/* CAMPAIGN-PREP candidate for func_0201a84c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     GetSystemWork bound r5; acc r4=0 early; bit-loops orr<<(i+k) inline shift; bit10=(v<<0x15)>>31
 *   risk:       reshape-able: the else-branch order is inverted in asm (bit-set/acc|=0x800 sits in the bne=true block as the fall-through `.L_2fc`); if the if/else bodies emit in source order the branch polarity flips — swap the two arms to follow the asm.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_0201a84c (main, class C) — UNVERIFIED build-free draft.
 * switch(mode r0) with two small bit-accumulate loops. sys=GetSystemWork() bound (r5), acc r4=0.
 *   case 0: if (!func_0201a824()) acc |= 0x400;
 *           else { v=*(int*)(sys+0x8e8);
 *                  if (((v<<0x15)>>0x1f)==0) { *(int*)(sys+0x8e8)=v|0x400; acc|=0x800; }
 *                  else { if(func_0200a704()) acc|=0x1000; if(func_0200a928()) acc|=0x2000; }
 *                  if (acc==0) acc|=0x4000; }
 *   case 1: if (func_0201a824()) {
 *               for(i=0;i<3;i++) acc |= func_0200a68c(i) << (i+0xf);
 *               for(i=0;i<3;i++) acc |= func_0200a8b0(i) << (i+0x12);
 *               acc |= 0x200000; }
 *   return acc;
 * NOTE bit10 of +0x8e8 is (v<<0x15)>>0x1f. Loop shift uses i+const so DON'T bind i*S; inline (i+0xf). */
extern char *GetSystemWork(void);
extern int func_0201a824(void);
extern int func_0200a704(void);
extern int func_0200a928(void);
extern int func_0200a68c(int);
extern int func_0200a8b0(int);

int func_0201a84c(int mode) {
    char *r5 = GetSystemWork();
    int acc = 0;
    int i;
    if (mode == 0) {
        if (func_0201a824() == 0) {
            acc |= 0x400;
        } else {
            int v = *(int *)(r5 + 0x8e8);
            if ((unsigned int)((unsigned int)v << 0x15) >> 0x1f) {
                if (func_0200a704() != 0)
                    acc |= 0x1000;
                if (func_0200a928() != 0)
                    acc |= 0x2000;
            } else {
                *(int *)(r5 + 0x8e8) = v | 0x400;
                acc |= 0x800;
            }
            if (acc == 0)
                acc |= 0x4000;
        }
    } else if (mode == 1) {
        if (func_0201a824() != 0) {
            for (i = 0; i < 3; i++)
                acc |= func_0200a68c(i) << (i + 0xf);
            for (i = 0; i < 3; i++)
                acc |= func_0200a8b0(i) << (i + 0x12);
            acc |= 0x200000;
        }
    }
    return acc;
}
