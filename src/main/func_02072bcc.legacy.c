/* func_02072bcc: stamp a size field, relocate a 10-byte chunk, splice
 * in a 6-byte constant, byte-swap data_0219ef1c's high/low 16-bit
 * halves into two header fields (network byte order), then two more
 * const-splices and a final call -- all addressed relative to `a`,
 * including NEGATIVE offsets (a-8, a-0xe), so `a` sits mid-buffer.
 */

extern void func_02094688(const void *src, void *dst, int n);
extern void func_02073d30(void *a0, int a1, int a2, int a3);
extern int data_0219ef1c;
extern char data_0219ef2c[];

void func_02072bcc(char *a) {
    unsigned short hi, lo;

    *(unsigned short *)(a + 0x6) = 0x200;
    func_02094688(a + 0x8, a + 0x12, 10);
    func_02094688(data_0219ef2c, a + 0x8, 6);

    hi = (unsigned short)((unsigned int)data_0219ef1c >> 16);
    hi = (hi >> 8) | (hi << 8);
    *(unsigned short *)(a + 0xe) = hi;

    lo = (unsigned short)data_0219ef1c;
    lo = (lo >> 8) | (lo << 8);
    *(unsigned short *)(a + 0x10) = lo;

    func_02094688(a + 0x12, a - 0xe, 6);
    func_02094688(data_0219ef2c, a - 0x8, 6);
    func_02073d30(a - 0xe, 0x2a, 0, 0);
}
