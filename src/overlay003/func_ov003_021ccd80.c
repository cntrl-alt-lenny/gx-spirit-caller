/* func_ov003_021ccd80: look up the active layout cell — index a code table by
 * (global selector +0xc3c XOR arg), push its byte code, and return the address of
 * the cell's 0x1a-byte record. One of a 2-member family differing only in the two
 * tables (ov003_core.h). */
extern char data_021040ac[];
extern char data_02104c78[];
extern char data_02104c7a[];
extern void func_02001d68(int);
int func_ov003_021ccd80(int dummy, int arg) {
    int idx = *(int *)(data_021040ac + 0xc3c) ^ arg;
    func_02001d68(((signed char *)data_02104c78)[idx]);
    return (int)(data_02104c7a + idx * 0x1a);
}
