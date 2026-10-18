typedef unsigned short u16;
typedef unsigned int u32;

struct Arg {
    u16 id;
    u16 player : 1;
    u16 idx : 5;
    u16 _p : 10;
    u16 _q : 6;
    u16 val : 9;
    u16 _r : 1;
};

struct Slot {
    u32 _a : 13;
    u32 lo : 1;
    u32 _b : 8;
    u32 hi : 8;
    u32 _c : 2;
    char pad[16];
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];

extern int func_ov002_021d59cc(int a, int b, int c, int d, int e);
extern void func_ov002_0226b258(void);

int func_ov002_0222c00c(struct Arg *arg)
{
    struct Slot *s;
    int off;
    int p = arg->player;
    int idx = arg->idx;

    off = (p & 1) * 0x868;
    s = (struct Slot *)(data_ov002_022cf16c + off + 0x30 + idx * 20);

    if (arg->val != s->hi * 2 + s->lo) {
        return 0;
    }
    if (*(u16 *)(data_ov002_022cf1a4 + off + idx * 20) == 0) {
        return 0;
    }
    switch (data_ov002_022ce288[0x5a8 / 4]) {
    case 0x80:
        func_ov002_0226b258();
        return 0x7f;
    case 0x7f:
        func_ov002_021d59cc(p, idx, arg->id, 3, (u16)(*(u16 *)(data_ov002_022d0e6c + 0xb0) * 200));
        return 0;
    default:
        return 0;
    }
}
