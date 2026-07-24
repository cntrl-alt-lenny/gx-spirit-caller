/* func_ov006_021b9d1c: byteswap two u16s and subtract.
 *   ldrh ip,[r1] (b first) ; ldrh r3,[r0] (a)
 *   bswap(x) = ((x>>8)&0xff) | ((x&0xff)<<8)
 *   return (u16)bswap(a) - (u16)bswap(b) */

int func_ov006_021b9d1c(unsigned short *a, unsigned short *b) {
    int bb = *b;
    int aa = *a;
    int sb = ((bb >> 8) & 0xff) | ((unsigned char)bb << 8);
    int sa = ((aa >> 8) & 0xff) | ((unsigned char)aa << 8);
    return (unsigned short)sa - (unsigned short)sb;
}
