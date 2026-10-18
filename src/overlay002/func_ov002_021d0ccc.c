struct S021d0ccc { unsigned short f0; unsigned short f2; unsigned short f4; char pad[0x80c - 6]; int f80c; int f810; };
extern struct S021d0ccc data_ov002_022ce950;
extern unsigned int data_ov002_022cf17c[];
extern int data_ov002_022d016c[];
extern void func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_0229c7f8(int a);
extern void func_ov002_021ba230(int a);

void func_ov002_021d0ccc(void) {
    int flag;
    int f810;
    unsigned int f2;
    unsigned int f4;
    unsigned int packed;
    flag = (data_ov002_022ce950.f0 & 0x8000) ? 1 : 0;
    f2 = data_ov002_022ce950.f2;
    f4 = data_ov002_022ce950.f4;
    f810 = data_ov002_022ce950.f810;
    packed = f2 | (f4 << 16);

    switch (f810) {
    case 0:
        if (*(unsigned int *)((char *)data_ov002_022cf17c + (flag & 1) * 0x868) < 2) {
            data_ov002_022ce950.f80c = 0;
            return;
        }
        func_ov002_0229ade0(0x13, flag, 0, 0);
        data_ov002_022ce950.f810++;
        break;
    case 1:
        if (func_ov002_0229c7f8(0x13) != 0) {
            return;
        }
        *(unsigned int *)((char *)data_ov002_022d016c + 0xce4) = packed;
        func_ov002_021ba230(flag);
        func_ov002_0229ade0(0x14, flag, 0xd, 0);
        data_ov002_022ce950.f80c = 0;
        break;
    }
}
