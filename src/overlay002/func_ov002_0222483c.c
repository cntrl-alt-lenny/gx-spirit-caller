typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    u16 value;
    u16 player : 1;
    u16 rest : 15;
} Arg;
extern u32 data_ov002_022ce288[];
extern char data_ov002_022cf178[];
extern u16 data_ov002_022d0e6c[];
extern int func_ov002_021bbf50(int arg0);
extern void func_ov002_0226b094(int arg0, int arg1);
extern const char *func_ov002_021f4260(int arg0, int arg1);
extern void func_ov002_021ae430(int a, const char *src);
extern void func_ov002_0226af38(int arg0, int arg1, int arg2);
extern void func_ov002_0226b034(int arg0, int arg1, int arg2);
extern int func_ov002_021de4b0(int arg0, int arg1, int arg2);

int func_ov002_0222483c(Arg *p) {
    switch (*(u32 *)((char *)data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (*(int *)(data_ov002_022cf178 + ((1 - p->player) & 1) * 0x868) != 0 || func_ov002_021bbf50(1 - p->player) != 0) {
            func_ov002_0226b094(1 - p->player, p->value);
            return 0x7f;
        }
        return 0;
    case 0x7f:
        func_ov002_021ae430(p->player, func_ov002_021f4260(p->value, *(u16 *)((char *)data_ov002_022d0e6c + 0xb0)));
        return 0x7e;
    case 0x7e:
        switch (*(u16 *)((char *)data_ov002_022d0e6c + 0xb0)) {
        case 0:
            func_ov002_0226af38(1 - p->player, 1, 1);
            return 0;
        case 1:
            func_ov002_0226b034(1 - p->player, p->value, 0);
            break;
        }
        return 0x7d;
    case 0x7d: {
        int n = *(u16 *)((char *)data_ov002_022d0e6c + 0xb0);
        func_ov002_021de4b0((int)p, n & 0xff, (n >> 8) & 0xff);
        return 0;
    }
    }
    return 0;
}
