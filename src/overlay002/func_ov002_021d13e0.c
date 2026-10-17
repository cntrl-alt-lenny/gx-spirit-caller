typedef unsigned short u16;

typedef struct {
    u16 flags;
    u16 f2;
    u16 f4;
    char pad[0x806];
    int f80c;
} State;

typedef struct {
    char pad[0xd0];
    int fd0;
} Other;

extern State data_ov002_022ce950;
extern Other data_ov002_022d016c;
extern int func_ov002_0229ade0(int cmd, int a, int b, int c);

void func_ov002_021d13e0(void)
{
    u16 f4 = data_ov002_022ce950.f4;
    u16 f2 = data_ov002_022ce950.f2;
    if (f4 != 0) {
        data_ov002_022d016c.fd0 = data_ov002_022d016c.fd0 | (1 << f2);
    } else {
        data_ov002_022d016c.fd0 = data_ov002_022d016c.fd0 & ~(1 << f2);
    }
    func_ov002_0229ade0(0x24, 0, 0, 0);
    data_ov002_022ce950.f80c = 0;
}
