/* CAMPAIGN-PREP candidate for func_02245100 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ternary for movne+moveq const-pair; out*2 kind; byte-then-word load order
 *   risk:       Loop is heavily strength-reduced: orig keeps ce288 base both fixed(r1) AND advancing(lr) plus ip,ip+1,ip+2 regs; mwcc's induction-var set likely diverges by 1-2 regs. permuter-class.
 *   confidence: low
 */
/* func_ov002_02245100 (cls C): gate, then pack a counted u16 buffer
 * (count + per-i {byte, word-lo, word-hi}) and fire func_021b1570. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

extern char data_ov002_022ce288[];   /* _LIT1: count@+0x5d4, byte[]@+0x5dc, word[]@+0x5fc */
extern char data_ov002_022d016c[];   /* _LIT0: gate@+0xd0c */
extern void func_ov002_021b1570(int a, int b, u16 *out, int kind);

void func_ov002_02245100(int arg) {
    u16 buf[98];                 /* 0xc4 bytes */
    u32 count;
    u32 i;
    int out;

    if (*(int *)(data_ov002_022d016c + 0xd0c) == 0)
        return;

    count = *(u32 *)(data_ov002_022ce288 + 0x5d4);
    buf[0] = (u16)count;
    out = 1;
    for (i = 0; i < count; i++) {
        u32 w = *(u32 *)(data_ov002_022ce288 + 0x5fc + i * 4);
        buf[out]     = *(u8 *)(data_ov002_022ce288 + 0x5dc + i);
        buf[out + 1] = (u16)w;
        buf[out + 2] = (u16)(w >> 16);
        out += 3;
    }
    func_ov002_021b1570(arg ? 0xc : 0xb, -1, buf, out * 2);
}
