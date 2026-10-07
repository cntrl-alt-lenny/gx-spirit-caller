/* func_02073f28: verify a checksum over two spans (one-s complement sum of
 * a0[0..a1) and the 8 bytes at a2 + 0xc, plus a1); non-zero when it is not 0xffff. */
extern unsigned int func_02073fc8(void *p, unsigned int len, unsigned int init);

int func_02073f28(void *a0, unsigned int a1, char *a2, unsigned int a3) {
    unsigned int sum;
    sum = func_02073fc8(a0, a1, a3);
    sum = func_02073fc8(a2 + 0xc, 8, sum);
    sum += a1;
    if (sum & 0x10000) {
        sum = (sum + 1) & 0xffff;
    }
    return sum != 0xffff;
}
