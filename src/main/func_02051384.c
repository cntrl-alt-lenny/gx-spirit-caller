/* func_02051384: init call, then populate several fields on the
 * func_020498f0() singleton (called fresh, uncached, for each field
 * write) and one byte of data_0219dc8c, kick two more inits, then
 * bail unless both a readiness flag and a field are clear, finally
 * dispatching func_02051618 with the singleton's field_200.
 */

extern char *func_020498f0(void);
extern void func_0204f310(int p0, int p1, int p2, int p3);
extern void func_020498dc(int x);
extern int  func_0204f820(void);
extern int  func_0204ab88(int r4);
extern void func_02051618(int x);
extern unsigned char data_0219dc8c[];

void func_02051384(int a0, int a1, int a2, int a3, int a4) {
    func_0204f310(2, a0, a1, a2);
    *(int *)(func_020498f0() + 0x46c) = a3;
    *(int *)(func_020498f0() + 0x470) = a4;
    *(int *)(func_020498f0() + 0xf4) = *(int *)(func_020498f0() + 0x200);
    *(int *)(func_020498f0() + 0x2f0) = 1;
    func_020498f0()[0xe] = 0;
    data_0219dc8c[1] = 0;

    func_020498dc(0xa);
    if (func_0204ab88(func_0204f820()) != 0) {
        return;
    }
    if (*(int *)(func_020498f0() + 0x10) != 0) {
        return;
    }
    func_02051618(*(int *)(func_020498f0() + 0x200));
}
