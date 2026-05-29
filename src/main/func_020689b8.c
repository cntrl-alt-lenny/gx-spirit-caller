/* func_020689b8: frameless-leaf byteswap16 of s->f4 (default tier). */
unsigned short func_020689b8(unsigned short *s) {
    unsigned short x = s[2];
    return (unsigned short)(((x >> 8) & 0xff) | ((x << 8) & 0xff00));
}
