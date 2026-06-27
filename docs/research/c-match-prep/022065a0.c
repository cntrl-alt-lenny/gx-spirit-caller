/* CAMPAIGN-PREP candidate for func_022065a0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     parity index cf17c[(bit0&1)*0x868] base-via-addressing; explicit &1 to force the and; 2nd bit0 read has no &1.
 *   risk:       reshape-able: the redundant 'and #1' after lsl#31;lsr#31 may be folded away by mwcc on a :1 field (1 instr short). If so, extract bit0 via (field<<31)>>31 instead of a bitfield.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_022065a0 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft.
 * asm: r4=arg; p=field@+2 bit0(:1) & 1; if(*(int*)(cf17c + p*0x868) != 0) return 1.
 *      else r=0223f6c4(); return 022536e8(bit0, field@+0, r) ? 1 : 0.
 * Parity selects a 0x868-strided sub-table in cf17c (base via addressing, int load).
 * asm shows lsl#1f;lsr#1f THEN and #1 -> explicit & 1 on the :1 extract. */
typedef unsigned short u16;

extern char data_ov002_022cf17c[];   /* 0x868 parity-stride int table */
extern int  func_ov002_0223f6c4(void);
extern int  func_ov002_022536e8(int a, int b, int c);

struct Ent65a0 { u16 f0; u16 b0 : 1; u16 _r : 15; };

int func_ov002_022065a0(struct Ent65a0 *p) {
    if (*(int *)(data_ov002_022cf17c + (p->b0 & 1) * 0x868) != 0)
        return 1;
    {
        int r = func_ov002_0223f6c4();
        if (func_ov002_022536e8(p->b0, p->f0, r) == 0)
            return 0;
    }
    return 1;
}
