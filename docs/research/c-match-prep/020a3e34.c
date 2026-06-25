/* CAMPAIGN-PREP candidate for func_020a3e34 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind global once; mwcc reloads per store; ordered field stores; if-return guards
 *   risk:       struct-guessed: +0x10/+0x500/+0x502/+0x50d offsets inferred from strh/ldrb; padding sizes must match the real Tbl or the +0x500 base-adds shift. Confirm struct.
 *   confidence: med
 */
/* func_020a3e34 — IRQ-guarded "register entry" into a global table.
 *
 *   r5=p (arg0), r4=v (arg1); saved=OS_DisableIrq() held in r6.
 *   if (g->flag_50d != 0) { restore; return 0; }      // busy/locked
 *   if (func_020a3ed8(p, 8, v) == 0) { restore; return 0; }
 *   g->field_10 = v; g->field_500 = p; g->field_502 = 8;
 *   restore; return 1;
 *
 * The store sequence reloads *data_021a98f8 three times and re-adds
 * #0x500 twice (strh imm8 can't reach +0x500) — modelled by a single
 * struct pointer global; mwcc reloads it per store on its own.
 */

typedef struct {
    unsigned short field_10;   /* +0x10  <- v   */
    char           _pad_12[0x500 - 0x12];
    unsigned short field_500;  /* +0x500 <- p   */
    unsigned short field_502;  /* +0x502 <- 8   */
    char           _pad_504[0x50d - 0x504];
    unsigned char  flag_50d;   /* +0x50d        */
} Tbl;

extern Tbl  *data_021a98f8;
extern int   OS_DisableIrq(void);
extern void  OS_RestoreIrq(int saved);
extern int   func_020a3ed8(int p, int kind, int v);

int func_020a3e34(int p, int v) {
    int saved = OS_DisableIrq();

    if (data_021a98f8->flag_50d != 0) {
        OS_RestoreIrq(saved);
        return 0;
    }
    if (func_020a3ed8(p, 8, v) == 0) {
        OS_RestoreIrq(saved);
        return 0;
    }

    data_021a98f8->field_10  = (unsigned short)v;
    data_021a98f8->field_500 = (unsigned short)p;
    data_021a98f8->field_502 = 8;

    OS_RestoreIrq(saved);
    return 1;
}
