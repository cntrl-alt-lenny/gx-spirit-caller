extern unsigned short data_ov002_022ce950[];
extern struct { int pad[0x33b]; int fcec; int fcf0; int pad2; int fcf8; char pad3[0x20]; int fd1c; int fd20; } data_ov002_022d016c;
extern struct { char _pad0[4]; int f4; } data_ov002_022cd73c;
extern char data_ov002_022cf16c[];
extern void func_ov002_021b0b54(int, int);
extern void func_ov002_0229ade0(int, int, int, int);

void func_ov002_021d109c(void)
{
    int flag = (data_ov002_022ce950[0] & 0x8000) != 0;
    int s;
    data_ov002_022d016c.fcec ^= 1;
    data_ov002_022d016c.fcf0 += 1;
    data_ov002_022d016c.fd1c = 0;
    data_ov002_022d016c.fd20 = 0;
    data_ov002_022d016c.fcf8 = 7;
    s = data_ov002_022cd73c.f4;
    func_ov002_021b0b54(0x38, *(int *)(data_ov002_022cf16c + (s & 1) * 0x868) < *(int *)(data_ov002_022cf16c + ((s ^ 1) & 1) * 0x868));
    func_ov002_0229ade0(5, 1 - flag, 0, 0);
    *(int *)((char *)data_ov002_022ce950 + 0x80c) = 0;
}
