typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 f0;
    u16 side : 1;
    u16 idx : 5;
    u16 pad2 : 10;
    u16 pad3 : 6;
    u16 val : 9;
    u16 pad4 : 1;
    u16 f6;
    u16 f8;
} S;

typedef struct {
    u32 pad0 : 13;
    u32 lo : 1;
    u32 pad1 : 8;
    u32 hi : 8;
    u32 pad2 : 2;
    u32 pad[4];
} E;

typedef struct {
    E e[1];
} dummy;

typedef struct {
    u32 pad[0xc];
    E e[0x20];
    char padx[0x868 - 0x30 - 0x20 * 0x14];
} T;

typedef struct {
    u16 e[10];
} H;

typedef struct {
    H h[0x20];
    char pad[0x868 - 0x20 * 0x14];
} U;

extern T data_ov002_022cf16c[];
extern U data_ov002_022cf1a4[];

extern void func_ov002_021d59cc(int a, int b, int c, int d, int e);

int func_ov002_02220288(S *p) {
    int side = p->side;
    int idx = p->idx;
    E *e = &data_ov002_022cf16c[side & 1].e[idx];
    if (p->val != e->hi * 2 + e->lo)
        return 0;
    if (data_ov002_022cf1a4[side & 1].h[idx].e[0] != 0)
        func_ov002_021d59cc(side, idx, p->f0, 0x12, (u16)(p->f8 * 300));
    return 0;
}
