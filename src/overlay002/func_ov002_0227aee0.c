typedef unsigned short u16;
extern char data_ov002_022cf1a4[];
extern void func_ov002_021c4c9c(int a, int b, int *out);
void func_ov002_0227aee0(int a, int b, int *out)
{
    if (*(u16 *)(data_ov002_022cf1a4 + (a & 1) * 0x868 + b * 0x14) == 0) {
        *(u16 *)(data_ov002_022cf1a4 + (a & 1) * 0x868 + b * 0x14) = 1;
        func_ov002_021c4c9c(a, b, out);
        *(u16 *)(data_ov002_022cf1a4 + (a & 1) * 0x868 + b * 0x14) = 0;
    } else {
        func_ov002_021c4c9c(a, b, out);
    }
}
