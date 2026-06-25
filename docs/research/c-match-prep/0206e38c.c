/* CAMPAIGN-PREP candidate for func_0206e38c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     orr-accumulator(acc-first); orrgt signed>0; d==1||(flag) gate; irq bracket
 *   risk:       `cmp r0,#0;orrgt` is SIGNED >0 on the two helper results -> use `>0` not `!=0` (reshape-able). The `(p->m70&0x40)` ands result is consumed two insns later across the m73 load; if mwcc reorders the ldrsb the orrne flag-carry breaks (permuter-class scheduling).
 *   confidence: med
 */
/* func_0206e38c (main, class C): accumulate status bits about a sub-object
 * into a flag word, with an IRQ-bracketed middle section. param is the
 * sub-object (m8 u8, m70 s16 flags, m73 s8). */

typedef struct {
    char         _pad_00[0x8];
    unsigned char m8;        /* +0x8  ldrb */
    char         _pad_09[0x70 - 0x9];
    short        m70;        /* +0x70 ldrsh/strh */
    char         _pad_72[1];
    signed char  m73;        /* +0x73 */
} obj_t;

extern int  func_0206e4a4(obj_t *p);
extern int  func_0206e33c(obj_t *p);
extern int  func_0206d79c(obj_t *p);
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);

int func_0206e38c(obj_t *p) {
    int acc = 0;
    signed char d;

    if (func_0206e4a4(p) != 0)
        return acc | 0x80;

    if (p->m70 & 0x40) acc |= 0x20;
    d = p->m73;
    if (d == 1 || (p->m70 & 4)) {
        int saved = OS_DisableIrq();
        if (func_0206e33c(p) > 0) acc |= 1;
        if (func_0206d79c(p) > 0) acc |= 8;
        OS_RestoreIrq(saved);
    }

    if (p->m73 == 0 || p->m73 == 4) {
        if (p->m70 & 4) {
            if (p->m8 != 4) {
                if (!(acc & 1))
                    p->m70 &= ~6;
            }
        }
        if (!(p->m70 & 2)) {
            if (!(p->m70 & 4))
                acc |= 0x40;
        }
    }
    return acc;
}
