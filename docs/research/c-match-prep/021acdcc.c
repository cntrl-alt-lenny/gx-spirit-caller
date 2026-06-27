/* CAMPAIGN-PREP candidate for func_021acdcc (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     byte :8 bitfield at bit8 (lsl#24;lsr#16); reload f_80 each use; store-order
 *   risk:       reshape-able (store-order): orig fuses both byte-clears into one ldr/str (bic#0xff00;orr;bic#0xff); two field-writes may emit 2 ldr/str -- if so merge to single `(w&0xffff0000)|((arg3&0xff)<<8)`.
 *   confidence: med
 */
/* func_ov000_021acdcc: insert arg3 as an 8-bit field at bit8 of *(p+0x9c)
 * (low byte zeroed in the same store), then 4 store-order word writes:
 * [0x90]=arg1-[0x80]; [0x94]=arg2-[0x84]; [0x88]=[0x80]; [0x8c]=[0x84].
 *
 *   ldr ip,[r0,#0x9c]; and r3,r3,#0xff; bic ip,ip,#0xff00
 *   mov r3,r3,lsl#0x18; orr r3,ip,r3,lsr#0x10; bic r3,r3,#0xff; str r3,[r0,#0x9c]
 *   ldr r3,[r0,#0x80]; sub r1,r1,r3; str r1,[r0,#0x90]   ; [0x80] RELOADED below
 *   ldr r1,[r0,#0x84]; sub r1,r2,r1; str r1,[r0,#0x94]
 *   ldr r1,[r0,#0x80]; str r1,[r0,#0x88]
 *   ldr r1,[r0,#0x84]; str r1,[r0,#0x8c]
 */

struct Ov000Acdcc {
    char         _pad0[0x80];
    int          f_80;        /* 0x80 */
    int          f_84;        /* 0x84 */
    int          f_88;        /* 0x88 */
    int          f_8c;        /* 0x8c */
    int          f_90;        /* 0x90 */
    int          f_94;        /* 0x94 */
    char         _pad1[0x9c - 0x98];
    unsigned int b0 : 8;      /* 0x9c bit0  (zeroed) */
    unsigned int b8 : 8;      /* 0x9c bit8  = arg3   */
    unsigned int rest : 16;
};

void func_ov000_021acdcc(struct Ov000Acdcc *p, int arg1, int arg2, int arg3) {
    p->b8 = arg3;
    p->b0 = 0;
    p->f_90 = arg1 - p->f_80;
    p->f_94 = arg2 - p->f_84;
    p->f_88 = p->f_80;
    p->f_8c = p->f_84;
}
