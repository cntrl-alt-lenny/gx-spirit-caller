typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    u16 f0;
    u16 side:1;
    u16 idx:5;
    u16 pad2:10;
    u16 pad3:6;
    u16 val:9;
    u16 pad4:1;
    u16 f6, f8, fa, fc;
} S;
typedef struct {
    u32 pad0:13;
    u32 lo:1;
    u32 pad1:8;
    u32 hi:8;
    u32 pad2:2;
    u32 pad[4];
} E;
typedef struct { u32 pad[12]; E e[32]; char tail[0x5b8]; } T;
typedef struct { u16 e[10]; } H;
typedef struct { H h[32]; char tail[0x5e8]; } U;
extern T data_ov002_022cf16c[];
extern U data_ov002_022cf1a4[];
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
int func_ov002_02220038(S *p, int unused1) {
    u16 side = p->side;
    u16 idx = p->idx;
    u16 val = p->val;

    if (data_ov002_022cf16c[side & 1].e[idx].hi * 2 + data_ov002_022cf16c[side & 1].e[idx].lo != val) return 0;
    if (data_ov002_022cf1a4[side & 1].h[idx].e[0] != 0) {
        int amount = 0;
        if (p->f0 == 0x1835) amount = p->fc * 1000;
        func_ov002_021d59cc(side, idx, p->f0, 3, (u16)amount);
    }
    return 0;
}





