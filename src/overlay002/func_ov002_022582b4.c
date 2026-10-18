extern char data_ov002_022d016c[];
struct S { char pad[0x5d8]; int f; };
extern struct S data_ov002_022ce288;

extern void func_ov002_022583b4(int a, int b, int c);
extern void func_ov002_02254a2c(int a);
extern void func_ov002_021e3354(unsigned int a, unsigned int b, int c);
extern void func_ov002_021e311c(unsigned int a, unsigned int b);

void func_ov002_022582b4(int arg)
{
    if (*(unsigned int *)(data_ov002_022d016c + 0xd5c) == 0xfee) {
        func_ov002_022583b4(1, 0, 0);
        return;
    }
    data_ov002_022ce288.f = 1;
    func_ov002_02254a2c(*(int *)(data_ov002_022d016c + 0xd70));
    if (arg != 0) {
        func_ov002_021e3354(
            ((*(unsigned int *)(data_ov002_022d016c + 0xd70) << 31) & 0x80000000) | 0x4e0000
                | (*(unsigned int *)(data_ov002_022d016c + 0xd5c) & 0xffff),
            *(unsigned int *)(data_ov002_022d016c + 0xd60) & 0xffff, arg);
    } else {
        func_ov002_021e311c(
            ((*(unsigned int *)(data_ov002_022d016c + 0xd70) << 31) & 0x80000000) | 0x4e0000
                | (*(unsigned int *)(data_ov002_022d016c + 0xd5c) & 0xffff),
            *(unsigned int *)(data_ov002_022d016c + 0xd60) & 0xffff);
    }
    *(int *)(data_ov002_022d016c + 0xd50) = 0;
}
