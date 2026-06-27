/* CAMPAIGN-PREP candidate for func_0222c00c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl flag0/k5 first; record :N bitfield via struct cast; mla base
 *   risk:       orig holds flag0(r0)+k5(r1) across the whole validate block to the 5-arg call; if mwcc recomputes from attr at the call site the arg setup diverges -> permuter-class
 *   confidence: low
 */
/* func_ov002_0222c00c (ov002, D) - mla table-base validate then phase dispatch.
 * attr@+2: flag0:1@0, k5:5@1.  f4=(h4>>6)&0x1ff (:9@6 of h4@+4).
 * rec = *(int*)(cf16c + flag0*0x868 + 0x30 + k5*0x14); recA:8@22, recB:1@13.
 * validate: if(f4 != recA*2 + recB) return 0;
 *           if(*(u16*)(cf1a4 + flag0*0x868 + k5*0x14) == 0) return 0;
 * phase 0x80 -> 226b258(); return 0x7f
 *       0x7f -> 021d59cc(flag0,k5,h0,3,(u16)(*(u16*)(d0e6c+0xb0)*0xc8)); return 0 */
extern unsigned char data_ov002_022ce288[];
extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022cf1a4[];
extern unsigned char data_ov002_022d0e6c[];
extern int func_ov002_021d59cc(int a, int b, int c, int d, int e);
extern int func_ov002_0226b258(void);

typedef struct Obj {
    unsigned short h0;                       /* 0x00 */
    unsigned short flag0 : 1, k5 : 5, : 10;  /* 0x02 */
    unsigned short : 6, f4 : 9, : 1;         /* 0x04 */
} Obj;

struct Rec { unsigned : 13, recB : 1, : 8, recA : 8, : 2; }; /* word@rec: recB@13, recA@22 */

int func_ov002_0222c00c(Obj *o) {
    int flag0 = o->flag0;
    int k5 = o->k5;
    struct Rec *rec = (struct Rec *)(data_ov002_022cf16c + flag0 * 0x868 + 0x30 + k5 * 0x14);
    int phase;
    if (o->f4 != rec->recA * 2 + rec->recB) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + flag0 * 0x868 + k5 * 0x14) == 0) return 0;
    phase = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (phase == 0x7f) {
        func_ov002_021d59cc(flag0, k5, o->h0, 3,
                            (unsigned short)(*(unsigned short *)(data_ov002_022d0e6c + 0xb0) * 0xc8));
        return 0;
    }
    if (phase != 0x80) return 0;
    func_ov002_0226b258();
    return 0x7f;
}
