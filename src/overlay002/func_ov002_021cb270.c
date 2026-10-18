typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 a;
    u16 b;
    char pad[0x808];
    int c;
} In;

typedef struct {
    char pad0[0xd0];
    u32 flags;
    char pad1[0xcec - 0xd4];
    int idx;
    char pad2[0xd0c - 0xcf0];
    int cond;
    char pad3[0xd2c - 0xd10];
    int x;
    int y;
} St;

extern In data_ov002_022ce950;
extern St data_ov002_022d016c;
extern int data_ov002_022cd744[];

extern void func_ov002_021c1010(int a, int b);
extern int func_ov002_0229ade0(int a, int b, int c, int d);

void func_ov002_021cb270(void)
{
    int r0 = (data_ov002_022ce950.a & 0x8000) ? 1 : 0;
    int r1 = data_ov002_022ce950.b;

    if (data_ov002_022d016c.cond == 0 || data_ov002_022cd744[data_ov002_022d016c.idx] != 2) {
        data_ov002_022d016c.x = 0xb;
        data_ov002_022d016c.y = 0;
    }
    func_ov002_021c1010(r0, r1);
    data_ov002_022d016c.flags &= ~2;
    func_ov002_0229ade0(0x24, 0, 0, 0);
    data_ov002_022ce950.c = 0;
}
