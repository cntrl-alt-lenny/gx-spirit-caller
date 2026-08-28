/* func_ov004_021db780: transcode a byte string into a u16 buffer. Bytes in
 * [0x80,0xa0) are remapped through data_ov004_02200c78 (indexed by
 * byte-0x80); all other bytes pass through as-is widened to u16. Returns the
 * output length (== number of source bytes consumed, excluding the
 * terminator) and null-terminates the u16 output. */
extern unsigned short data_ov004_02200c78[];

int func_ov004_021db780(unsigned char *src, unsigned short *dst) {
    int i;
    for (i = 0; src[i] != 0; i++) {
        unsigned char c = src[i];
        if (c < 0x80 || c >= 0xa0) {
            dst[i] = c;
        } else {
            dst[i] = data_ov004_02200c78[c - 0x80];
        }
    }
    dst[i] = 0;
    return i;
}
