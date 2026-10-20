typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 value; u16 player:1; u16 rest:15; } Arg;
typedef struct { u32 pad:13; u32 flag:1; u32 rest:18; } Slot;
extern u32 data_ov002_022ce288[];
extern char data_ov002_022cf178[];
extern u16 data_ov002_022d0e6c[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021c3bdc(int idx);
extern void *func_ov002_021c93f0(int player, int kind, int extra);
extern void func_ov002_021d71e0(int player, int idx, int flag);
extern int func_ov002_021e27c0(int self_thing, int arg1);
extern int func_ov002_021e286c(int arg0);
extern void func_ov002_0226af94(int arg0, int arg1, int arg2);
int func_ov002_02224a14(Arg *p) {
    switch (*(int *)((char *)data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (*(int *)(data_ov002_022cf178 + ((1 - p->player) & 1) * 0x868) == 0) return 0;
        if (func_ov002_021c3bdc(1 - p->player) == 0) return 0x64;
        func_ov002_0226af94(p->player, p->value, 1);
        return 0x7f;
    case 0x7f: {
        int n = *(u16 *)((char *)data_ov002_022d0e6c + 0xb0);
        u32 flag = ((Slot *)func_ov002_021c93f0(1 - p->player, 11, n))->flag;
        func_ov002_021d71e0(1 - p->player, n, 1);
        func_ov002_021e286c(flag);
        return 0;
    }
    case 0x64:
        func_ov002_021e27c0(1 - p->player, 1);
        return 0x63;
    case 0x63:
        func_ov002_021ae400(p->player, 0x11);
        return 0x62;
    case 0x62:
        func_ov002_021e27c0(1 - p->player, 0);
        return 0;
    }
    return 0;
}
