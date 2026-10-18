typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 pad0;
    u16 a : 1;
    u16 b : 5;
    u16 rest : 10;
} Arg;

extern u32 data_ov002_022ce288[];
extern u16 data_ov002_022d0e6c[];
extern void func_ov002_0226b258();
extern int func_ov002_021de4b0(u32 a, u32 b, u32 c);

int func_ov002_02224994(Arg *p)
{
    switch (*(u32 *)((char *)data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        func_ov002_0226b258(p->a, p->b);
        return 0x7f;
    case 0x7f: {
        u32 n = *(u16 *)((char *)data_ov002_022d0e6c + 0xb0);
        if (n == 6) {
            return 0x80;
        }
        func_ov002_021de4b0((u32)p, 1 - p->a, n - 1);
        return 0;
    }
    }
    return 0;
}
