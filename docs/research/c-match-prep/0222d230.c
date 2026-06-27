/* CAMPAIGN-PREP candidate for func_0222d230 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sel=1-flag0; mla base via sel*0x868; record :1@13 struct cast; bind idx
 *   risk:       orig holds sel(r0) across the table load to the 0226af78/021d71e0 call and folds base into the mla; mwcc may split the mla into mul+add or recompute sel -> permuter-class scheduling around mla
 *   confidence: low
 */
/* func_ov002_0222d230 (ov002, D) - (1-flag0)*stride mla base + bitfield, phase.
 * phase on ce288+0x5a8. sel = 1 - card->flag0.
 * 0x80: if(*(int*)(cf178 + sel*0x868) == 0) return 0; 0226af78(sel, 0); return 0x7f.
 * 0x7f: idx = *(u16*)(d0e6c+0xb0);
 *       v = *(int*)(cf16c + sel*0x868 + idx*4 + 0x120);
 *       021d71e0(sel, idx, 1);
 *       021e286c((v>>13)&1);                          (:1@13, lsl12;lsr1f)
 *       return 0. */
extern unsigned char data_ov002_022ce288[];
extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022cf178[];
extern unsigned char data_ov002_022d0e6c[];
extern int func_ov002_021d71e0(int a, int b, int c);
extern int func_ov002_021e286c(int a);
extern int func_ov002_0226af78(int a, int b);

typedef struct Obj {
    unsigned short h0;
    unsigned short flag0 : 1, : 15;   /* 0x02 */
} Obj;
struct Rec { unsigned : 13, f13 : 1, : 18; };  /* word@+0x120 region: bit13 */

int func_ov002_0222d230(Obj *o) {
    int phase = *(int *)(data_ov002_022ce288 + 0x5a8);
    int sel = 1 - o->flag0;
    if (phase == 0x7f) {
        int idx = *(unsigned short *)(data_ov002_022d0e6c + 0xb0);
        struct Rec *v = (struct Rec *)(data_ov002_022cf16c + sel * 0x868 + idx * 4 + 0x120);
        func_ov002_021d71e0(sel, idx, 1);
        func_ov002_021e286c(v->f13);
        return 0;
    }
    if (phase != 0x80) return 0;
    if (*(int *)(data_ov002_022cf178 + sel * 0x868) == 0) return 0;
    func_ov002_0226af78(sel, 0);
    return 0x7f;
}
