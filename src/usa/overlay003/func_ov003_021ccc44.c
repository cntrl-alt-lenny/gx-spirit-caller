/* func_ov003_021ccc44: look up the active layout cell — index a code table by
 * (global selector +0xc3c XOR arg), push its byte code, and return the address of
 * the cell's 0x1a-byte record. One of a 2-member family differing only in the two
 * tables (ov003_core.h). */
extern char data_02103fcc[];
extern char data_02104b98[];
extern char data_02104b9a[];
extern void func_02001d48(int);
int func_ov003_021ccc44(int dummy, int arg) {
    int idx = *(int *)(data_02103fcc + 0xc3c) ^ arg;
    func_02001d48(((signed char *)data_02104b98)[idx]);
    return (int)(data_02104b9a + idx * 0x1a);
}
