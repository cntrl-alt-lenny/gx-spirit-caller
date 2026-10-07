/* func_020779d8: read a BER-style length from *pp (short form, or 0x80|n
 * followed by n big-endian bytes); -1 on overflow of 32 bits. */
int func_020779d8(unsigned char **pp) {
    unsigned char *p = *pp;
    unsigned int val = *p++;
    if (val & 0x80) {
        int n = val & 0x7f;
        val = 0;
        while (n-- != 0) {
            if (val & 0xff000000) {
                return -1;
            }
            val = *p++ + (val << 8);
        }
    }
    *pp = p;
    return val;
}
