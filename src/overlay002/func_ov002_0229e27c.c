typedef struct {
    signed char active, pad, angle, view;
    short status, x, y;
    unsigned short flags;
    int key, fade;
} Node;
typedef struct { Node nodes[8]; int side, count, base; int cur, prev, timer, phase; } Obj;
typedef struct { unsigned int attr; unsigned short tile, pad; } Sprite;
typedef struct { int pad; unsigned int unused:3, flags:2, rest:27; } State;
extern State data_02104f4c;
extern int data_ov002_022cd73c[];
extern int data_ov002_022ca390[];
extern char data_ov002_022d0f98[];
extern void func_ov002_0229d5c0(Node *p);
extern int func_0207f05c(void *, void *, int);
static inline void position(Sprite *s, int x, int y) {
    unsigned int flags = data_02104f4c.flags;
    if (flags & 1) x -= 24;
    if (flags & 2) y -= 16;
    s->attr = (s->attr & 0xfe00ff00) | (y & 255) | ((x & 511) << 16);
}
static inline unsigned int has_prev(Obj *p) { int result; if (p->base > 0) result = 1; else result = 0; return result; }
static inline unsigned int has_next(Obj *p) { int result; if (p->base < p->count - 8) result = 1; else result = 0; return result; }
void func_ov002_0229e27c(Obj *p) {
    int i;
    Node *n = p->nodes;
    Sprite s;
    for (i = 0; i < 8; i++, n++) func_ov002_0229d5c0(n);
    s.attr = 0x8000a000;
    s.tile = 0x1800;
    if (has_prev(p)) {
        int x, y;
        y = data_ov002_022ca390[p->side == (data_ov002_022cd73c[1] ^ 1)] - 16;
        if (p->side == (data_ov002_022cd73c[1] ^ 1)) {
            x = 230;
            s.attr &= 0xc1fffcff;
        } else {
            x = 34;
            s.attr = (s.attr & 0xc1fffcff) | 0x10000000;
        }
        position(&s, x, y);
        s.tile = (s.tile & 0xfffffc00) | (((p->phase == -1) * 512 + 1024) / 128);
        func_0207f05c(data_ov002_022d0f98, &s, 1);
    }
    if (has_next(p)) {
        int x, y;
        y = data_ov002_022ca390[p->side == (data_ov002_022cd73c[1] ^ 1)] - 16;
        if (p->side == (data_ov002_022cd73c[1] ^ 1)) {
            x = 34;
            s.attr = (s.attr & 0xc1fffcff) | 0x10000000;
        } else {
            x = 230;
            s.attr &= 0xc1fffcff;
        }
        position(&s, x, y);
        s.tile = (s.tile & 0xfffffc00) | (((p->phase == 1) * 512 + 1024) / 128);
        func_0207f05c(data_ov002_022d0f98, &s, 1);
    }
    p->phase = 0;
}






