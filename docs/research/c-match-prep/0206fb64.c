/* CAMPAIGN-PREP candidate for func_0206fb64 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D store-order/bitfield: gate on global!=0; BE byteswap (u16)(v>>16)>>8; ordered byte stores
 *   risk:       the gate value v is loaded once (cmp), then RELOADED for each of bytes 2..5 (4x ldr [r1]); mwcc CSEs to one load -> bind/reload divergence; reshape needs separate re-reads, else permuter-class
 *   confidence: low
 */
/* func_0206fb64: guarded variant of 0206fa48 — emit one 6-byte TLV
 * (tag 0x32/len 0x04 + 4-byte BE payload of the global) only when the
 * gate global data_0219ef00 is non-zero, then 0xff terminator + fixup.
 *
 *   bl func_0206fc6c(key, 1, &loc) -> ip
 *   v = *data_0219ef00; if (v!=0) { ip[0]=0x32; ip[1]=0x04; <v BE>; ip+=6 }
 *   ip[0]=0xff; func_0206fc2c(0,0x12c,ip+1,(ip+1)-key); func_02070430(key, ret-key)
 *   return *(int*)loc
 */

extern unsigned char data_0219f262[];
extern unsigned char data_0219ef00[];
extern unsigned char *func_0206fc6c(void *key, int n, void *outloc);
extern int func_0206fc2c(int a0, unsigned a1, int a2, unsigned a3);
extern void func_02070430(void *base, int len);

int func_0206fb64(void) {
    int loc;
    unsigned char *p = func_0206fc6c(data_0219f262, 1, &loc);
    unsigned long v = *(unsigned long *)data_0219ef00;
    if (v != 0) {
        p[0] = 0x32;
        p[1] = 0x04;
        p[2] = (unsigned char)((unsigned short)(v >> 16) >> 8);
        p[3] = (unsigned char)(v >> 16);
        p[4] = (unsigned char)((unsigned short)v >> 8);
        p[5] = (unsigned char)v;
        p += 6;
    }
    p[0] = 0xff;
    {
        int r = func_0206fc2c(0, 0x12c, (int)(p + 1), (unsigned)((p + 1) - data_0219f262));
        func_02070430(data_0219f262, r - (int)data_0219f262);
    }
    return loc;
}
