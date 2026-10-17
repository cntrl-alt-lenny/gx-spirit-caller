/* func_02073fc8: Internet checksum accumulation over p[0..n) onto sum,
 * folded to 16 bits; odd-aligned buffers are read bytewise. */
unsigned short func_02073fc8(unsigned char *p, unsigned int n, unsigned int sum) {
    if ((unsigned int)p & 1) {
        while (n > 1) {
            sum += (unsigned short)((p[0] << 8) | p[1]);
            n -= 2;
            p += 2;
        }
    } else {
        unsigned short lo = sum;
        sum = (unsigned short)((lo >> 8) | (lo << 8));
        while (n > 1) {
            sum += *(unsigned short *)p;
            n -= 2;
            p += 2;
        }
        sum = ((sum >> 8) & 0x00ff00ff) | ((sum << 8) & 0xff00ff00);
        sum = (sum >> 16) | (sum << 16);
    }
    if (n != 0) {
        sum += p[0] << 8;
    }
    sum = (sum & 0xffff) + (sum >> 16);
    sum += sum >> 16;
    return sum;
}
