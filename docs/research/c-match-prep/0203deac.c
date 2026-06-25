/* CAMPAIGN-PREP candidate for func_0203deac (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Tiny scan loop, bit7 test via (b<<24)>>31, leaf bx lr
 *   risk:       Offset 0x447 + stride 4 guessed; u8 loop counter wrap (and #0xff) and bls/bcc unsigned compares
 *   confidence: med
 */
/* func_0203deac: scan for first entry whose bit7 is clear.
 *  cnt = p->cnt (byte@0xd12); result=0;
 *  for(i=0; (u8)i < cnt; i++)
 *    if( ((p->bytes[0x447 + i*4] << 24) >> 31) == 0 ){ result=i; break; }
 *  return result;
 * movs r1,r1,lsr#0x1f after lsl#0x18 isolates bit 7 (signed-ish);
 * the counter is masked to a byte (and ip,#0xff).
 */
int func_0203deac(unsigned char *p) {
    unsigned int cnt = p[0xd12];
    unsigned char i = 0;
    int result = 0;
    while (i < cnt) {
        if (((p[0x447 + i * 4] << 24) >> 31) == 0) {
            result = i;
            break;
        }
        i = (unsigned char)(i + 1);
    }
    return result;
}
