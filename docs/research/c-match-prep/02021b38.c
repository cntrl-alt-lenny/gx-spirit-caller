/* CAMPAIGN-PREP candidate for func_02021b38 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: (u16)=lsl16/lsr16 of cfg word; bind slotA base; i<256 store -1 at +0x48 stride16
 *   risk:       reshape-able: orig holds slotA in r4 across Fill32+loop but RELOADS it for the [+0x4] (u16) store (separate .word). Loop recomputes base+i*16 fresh each iter (don't bind product). struct-guessed on the 0x48 offset / non-element field.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02021b38 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: D: (u16) zero-extend cfg byte=lsl16/lsr16; bind slotA for Fill32+loop; counted i<256 store -1 at +0x48 stride16.
 */
extern void Fill32(int value, void *dst, int size);

typedef struct { int w[4]; } Slot16;            /* 16-byte stride element */
extern Slot16 data_02197434[256];               /* slot A array */
extern unsigned int data_021040ac[];            /* cfg table; [0x38/4]=[14] */
extern int data_02198434[];                     /* slot B; [0xb0/4]=[44] */

int func_02021b38(int arg) {
    Slot16 *base = &data_02197434[0];
    int i;

    Fill32(0, base, 0x34a8);                     /* Fill32(0, &data_02197434, 0x34a8) */
    data_02198434[44] = arg;                     /* str arg, [slotB + 0xb0] */
    /* (u16) zero-extend of cfg word: mov lsl16 / lsr16 */
    *((int *)((char *)&data_02197434 + 0x4)) =
        (unsigned short)data_021040ac[14];       /* data_02197434[1] = (u16)cfg */
    for (i = 0; i < 256; i++)
        *((int *)((char *)base + i * 16 + 0x48)) = -1;   /* mvn -1 */
    return 1;
}
