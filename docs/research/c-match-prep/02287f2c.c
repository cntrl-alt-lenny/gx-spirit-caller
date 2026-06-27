/* CAMPAIGN-PREP candidate for func_02287f2c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     leaf; compute nsel before sel (asm: rsb then and), mul both, ip/r2 temp order; signed >=3 test
 *   risk:       reshape-able: order of the two muls into ip vs r2 is decl-order driven — nsel*0x868 first (ip), sel*0x868 second (r2); swapping local decl order flips the registers and the two ldr bases.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct Ent { u16 f0; u16 f2; } Ent;

extern int data_ov002_022cf17c[];   /* LIT2 */
extern int data_ov002_022cf180[];   /* LIT1 */

int func_ov002_02287f2c(Ent *e)
{
    int bit;             /* ip = f2&1 */
    int nsel;            /* r2 = (1-bit)&1 */
    int sel;             /* r1 = bit&1 */
    int ina;             /* ip = nsel*0x868 */
    int inb;             /* r2 = sel*0x868 */
    int a;               /* r1 = data180[ina] */
    int b;               /* r0 = data17c[inb] */

    bit = e->f2 & 1;
    nsel = (1 - bit) & 1;
    sel = bit & 1;
    ina = nsel * 0x868;
    inb = sel * 0x868;
    a = *(int *)((char *)data_ov002_022cf180 + ina);
    b = *(int *)((char *)data_ov002_022cf17c + inb);
    if ((unsigned)a >= (unsigned)b) return 0;
    if (a >= 3) return 1;
    return 0;
}
