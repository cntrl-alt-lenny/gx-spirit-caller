extern struct { unsigned short f0; unsigned short f2; char pad[0x80c - 4]; int f80c; int f810; } data_ov002_022ce950;
extern char data_ov002_022cf288[];
extern void func_ov002_021c9b2c(int, int, int);
extern void func_ov002_0229ade0(int, int, int, int);
extern int func_ov002_0229c7f8(int);

void func_ov002_021d220c(void)
{
    int flag = (data_ov002_022ce950.f0 & 0x8000) != 0;
    int v = data_ov002_022ce950.f2;

    switch (data_ov002_022ce950.f810) {
    case 0:
        func_ov002_021c9b2c(flag, 1, v);
        func_ov002_0229ade0(0x12, flag, v, 0);
        if (v != 0) {
            *(int *)(data_ov002_022cf288 + (flag & 1) * 0x868) |= 4;
        }
        data_ov002_022ce950.f810 += 1;
        break;
    case 1:
        if (func_ov002_0229c7f8(0x12) == 0) {
            data_ov002_022ce950.f80c = 0;
        }
        break;
    }
}
