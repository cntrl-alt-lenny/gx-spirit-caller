typedef unsigned int u32;
typedef unsigned short u16;

struct Hdr {
    u16 w0;
    u16 b0 : 1;
    u16 rest : 15;
};

extern int data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021ba294(int a, int b);
extern int func_ov002_021d8288(int a, void *b);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021e286c(int a);
extern void func_ov002_0226b054(int a);

int func_ov002_02216fb8(struct Hdr *arg)
{
    switch (data_ov002_022ce288[0x5a8 / 4]) {
    case 0x80: {
        int idx = func_ov002_021ba294(arg->b0, 0x12e5);
        if (idx >= 0) {
            if (func_ov002_021d8288(arg->b0, data_ov002_022cf16c + (arg->b0 & 1) * 0x868 + 0x260 + idx * 4)) {
                return 0x64;
            }
        }
        func_ov002_021ae400(arg->b0, 0x15);
        return 0x6f;
    }
    case 0x6f:
        func_ov002_0226b054(1 - arg->b0);
        return 0x64;
    case 0x64:
        func_ov002_021e286c(arg->b0);
        return 0;
    }
    return 0;
}
