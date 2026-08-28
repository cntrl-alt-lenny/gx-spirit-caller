/* func_ov002_0229cf0c: the ov006/ov002 "command-record" family (see
 * ov006_core.h's 0201e5b8 note and the already-shipped sibling
 * func_ov002_0229d710) -- alloc a handle, fill+submit a 40-byte stack
 * command record, then Task_Invoke the handle. This member computes its
 * own handle via func_0202bdf8(c) (not the table-based func_02006bf0),
 * and returns the record's +0xc value (b<<10 + 0x12800).
 */
extern int func_0202bdf8(int c);
extern void func_0201d428(void *buf);
extern void func_0201e564(void *buf);
extern void Task_Invoke(int handle);

int func_ov002_0229cf0c(void *unused, int b, int c) {
    char local[40];
    int handle = func_0202bdf8(c);
    int result;

    func_0201d428(local);
    {
        unsigned short flags = *(unsigned short *)(local + 0x14);
        result = (b << 10) + 0x12800;
        flags = (flags & ~0xf) | 9;
        *(unsigned short *)(local + 0x14) = flags;
    }
    *(int *)(local + 0) = handle;
    {
        unsigned short flags2 = *(unsigned short *)(local + 0x14);
        flags2 |= 0x10;
        *(int *)(local + 0xc) = result;
        *(unsigned short *)(local + 0x14) = flags2;
        *(unsigned short *)(local + 0x10) = (c != 0) ? -1 : 0;
    }
    func_0201e564(local);
    Task_Invoke(handle);
    return result;
}
