typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 f0;
    u16 b0 : 1;
    u16 b1 : 5;
    u16 b6 : 10;
    u16 f4;
    u16 f6;
    u16 f8[2];
} Param;

extern struct { char pad0[0x5a8]; int state; u32 count; } data_ov002_022ce288;
extern struct { char pad0[0xcec]; u32 side; } data_ov002_022d016c;
extern struct { char pad0[0xb0]; u16 val; } data_ov002_022d0e6c;

extern int func_ov002_0226b258();
extern void func_ov002_021df818(Param *p, int a, int b);

int func_ov002_02223e2c(Param *p)
{
    int state = data_ov002_022ce288.state;
    u32 side = data_ov002_022d016c.side ^ data_ov002_022ce288.count;

    switch (state) {
    case 0x80:
        data_ov002_022ce288.count = 0;
        return 0x7f;
    case 0x7f: {
        int r;
        if (side == p->b0) {
            r = p->b1;
        } else {
            r = -1;
        }
        func_ov002_0226b258(side, r);
        return 0x7e;
    }
    case 0x7e: {
        int idx;
        int t;
        int n;
        p->f8[side] = data_ov002_022d0e6c.val;
        n = ++data_ov002_022ce288.count;
        if (n < 2) {
            return 0x7f;
        }
        if (p->f8[0] == p->f8[1]) {
            return 0x80;
        }
        idx = (p->f8[0] > p->f8[1]);
        t = p->f8[1 - idx];
        func_ov002_021df818(p, idx, t == 6 ? 0x1770 : t * 500);
        return 0;
    }
    }
    return 0;
}
