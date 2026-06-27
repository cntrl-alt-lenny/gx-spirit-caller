/* CAMPAIGN-PREP candidate for func_0206fa48 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D store-order/bitfield: BE byteswap via (u16)(w>>16)>>8; emit bytes 2..5 in order
 *   risk:       orig RELOADS each global word once per byte (4x ldr [r3]); mwcc -O4 will CSE the load to a single ldr -> bind/reload divergence; reshape-able only if globals re-read via separate u16 lvalues, else permuter-class
 *   confidence: low
 */
/* func_0206fa48: serialize a fixed header into a packet buffer.
 * When arg==0, emit two 6-byte TLVs whose 4-byte payloads are the two
 * globals written big-endian (each halfword byteswapped), then a 0xff
 * terminator + length fixup via helpers.
 *
 *   bl func_0206fc6c(key, 3, &loc) -> write ptr ip
 *   if (arg==0) { ip[0]=0x32; ip[1]=0x04; <ef00 BE>; ip[6]=0x36; ip[7]=0x04; <eeec BE>; ip+=12 }
 *   ip[0]=0xff; bl func_0206fc2c(0,0x12c,ip+1,(ip+1)-key); bl func_02070430(key, ret-key)
 *   return *(int*)loc
 *
 * Each 4-byte payload byteswaps the high then low halfword of the word
 * (lsr16;lsl16;lsr16;asr8 == (u16)(w>>16)>>8 etc).
 */

extern unsigned char data_0219f262[];
extern unsigned char data_0219ef00[];
extern unsigned char data_0219eeec[];
extern unsigned char *func_0206fc6c(void *key, int n, void *outloc);
extern int func_0206fc2c(int a0, unsigned a1, int a2, unsigned a3);
extern void func_02070430(void *base, int len);

int func_0206fa48(int arg) {
    int loc;
    unsigned char *p = func_0206fc6c(data_0219f262, 3, &loc);
    if (arg == 0) {
        unsigned long w0 = *(unsigned long *)data_0219ef00;
        unsigned long w1 = *(unsigned long *)data_0219eeec;
        p[0] = 0x32;
        p[1] = 0x04;
        p[2] = (unsigned char)((unsigned short)(w0 >> 16) >> 8);
        p[3] = (unsigned char)(w0 >> 16);
        p[4] = (unsigned char)((unsigned short)w0 >> 8);
        p[5] = (unsigned char)w0;
        p[6] = 0x36;
        p[7] = 0x04;
        p[8] = (unsigned char)((unsigned short)(w1 >> 16) >> 8);
        p[9] = (unsigned char)(w1 >> 16);
        p[10] = (unsigned char)((unsigned short)w1 >> 8);
        p[11] = (unsigned char)w1;
        p += 12;
    }
    p[0] = 0xff;
    {
        int r = func_0206fc2c(0, 0x12c, (int)(p + 1), (unsigned)((p + 1) - data_0219f262));
        func_02070430(data_0219f262, r - (int)data_0219f262);
    }
    return loc;
}
