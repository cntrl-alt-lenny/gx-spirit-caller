/* CAMPAIGN-PREP candidate for func_0203c89c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     unsigned arg for ldmcs/ldmls; preserve store order +0x9 before guards
 *   risk:       reshape-able: f_09 store at [a,+0x9] is emitted BEFORE the arg>=0x10 guard in orig; if mwcc hoists the comparison first, move the store up (it already is). Secondary: b held in r4 across both derefs -- bind, don't reload.
 *   confidence: med
 */
/* func_0203c89c: allocate a record + payload, populate from globals.
 * r6=arg. a = func_0203c900(1); b = func_0203c900(0x10). Store byte arg
 * at a[+0x9]. Guards (all unsigned): if arg>=0x10 return; if
 * arg <= byte a[+0x16] return; a[+0x16]=arg; if arg<=7 return.
 * a[+0x15] = func_0203c814( byte b[+0xd0d] ). a[+0x14] =
 * byte[ b + byte(b[+0xd13])*4 + 0x444 ]. */

extern int  func_0203c814(int v);
extern void *func_0203c900(int kind);

typedef struct Rec_0203c89c {
    char          _pad0[0x9];
    unsigned char f_09;          /* +0x09 */
    char          _pad1[0xa];
    unsigned char f_14;          /* +0x14 */
    unsigned char f_15;          /* +0x15 */
    unsigned char f_16;          /* +0x16 */
} Rec_0203c89c;

void func_0203c89c(unsigned int arg) {
    Rec_0203c89c *a = (Rec_0203c89c *)func_0203c900(1);
    unsigned char *b = (unsigned char *)func_0203c900(0x10);
    a->f_09 = (unsigned char)arg;
    if (arg >= 0x10) return;
    if (arg <= a->f_16) return;
    a->f_16 = (unsigned char)arg;
    if (arg <= 7) return;
    a->f_15 = (unsigned char)func_0203c814(b[0xd0d]);
    a->f_14 = b[(unsigned char)b[0xd13] * 4 + 0x444];
}
