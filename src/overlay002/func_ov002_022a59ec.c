typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 attr; u16 tile; u16 pad; } Oam;
extern short data_020bef80[];
extern struct { u32 unused; u32 low:3, next:2, rest:27; } data_02104f4c;
extern char data_ov002_022d0f7c[], data_ov002_022d0f98[];
extern void func_ov002_022a3b84(int *);
extern void func_ov002_022a4250(int *);
extern int func_0207ef90(void *, void *);
extern int func_0207f05c(void *, void *, int);
extern void func_0208b0f0(int unused0, int unused1, int unused2);
extern int func_020b3870(int, int);
static inline void pos(Oam *o, int y, int x) { o->attr = (o->attr & 0xfe00ff00) | (y & 255) | ((x & 511) << 16); }
static inline void tile(Oam *o, int t) { o->tile = (o->tile & ~0x3ff) | t; }
static inline void small(Oam *o, int x, int y, int t) { pos(o,y,x); tile(o,t); }
void func_ov002_022a59ec(int *p) {
    switch (p[0]) {
    case 1: func_ov002_022a3b84(p); break;
    case 2: func_ov002_022a4250(p); break;
    case 5: {
        Oam o;
        int a = p[2];
        int y;
        if (a >= 32) a = 32;
        a = (a << 10) >> 4;
        y = data_020bef80[a * 2 + 1];
        o.attr = 0xc0002000;
        o.tile = 0x7593;
        y = ((y << 7) >> 12) - 32;
        if (y - 40 > -64) {
            int x = ((int)data_02104f4c.next % 2) ? -12 : 12;
            o.attr = (o.attr & 0xfe00ff00) | ((y - 40) & 255) | (((x + 96) & 511) << 16);
            func_0207f05c(data_ov002_022d0f98, &o, 1);
        } else {
            small(&o, 96, y + 224, 0x23c);
            o.attr &= ~0xc00;
            o.tile &= ~0xf000;
            func_0207f05c(data_ov002_022d0f7c, &o, 1);
        }
        if (p[2] >= 48) p[0] = 0;
        break;
    }
    case 10: {
        Oam o;
        int frame = (p[2] / 4) % 4;
        int width = 32;
        int k;
        switch (data_02104f4c.low) { case 4: case 5:
            frame = (p[2] / 4) % 2;
            width = 64; break;
        }
        o.attr = (width == 32 ? 0xc0004000 : 0xc0000000) | 0x2000;
        o.tile = 0x1000;
        if (p[2] < 16) {
            int m[4];
            func_0208b0f0((int)m, 0x1000, func_020b3870(0x10000, p[2]+1));
            o.attr = (o.attr & 0xc1fffcff) | 0x100 | (func_0207ef90(data_ov002_022d0f98, m) << 25);
        } else if (p[2] > 80) {
            int m[4];
            func_0208b0f0((int)m, 0x1000, func_020b3870(0x10000, 97-p[2]));
            o.attr = (o.attr & 0xc1fffcff) | 0x100 | (func_0207ef90(data_ov002_022d0f98, m) << 25);
        }
        for (k=0; k<2; k++) {
            int t = 0xb980 + (width << 6)*(frame*2+k);
            pos(&o, 78-width/2, 64+k*64);
            tile(&o, t/128);
            func_0207f05c(data_ov002_022d0f98, &o, 1);
        }
        if (p[2] >= 96) p[0] = 0;
        break;
    }
    }
}










