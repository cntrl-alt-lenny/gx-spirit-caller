typedef struct { int keys[0x35]; int vals[0x35]; } Tbl;
typedef struct {
    signed char active, pad, angle, view;
    short status, x, y;
    unsigned short flags;
    int key, fade;
} Node;
typedef struct { unsigned int attr; unsigned short tile, pad; } Sprite;
extern short data_020bef80[];
extern int data_ov002_022d100c[];
extern char data_ov002_022d0f98[];
extern Tbl data_ov002_022d1014;
extern int func_0207ef90(void *, int *);
extern int func_0207f05c(void *, void *, int);
/* The existing assembly wrapper declares no operands, but consumes r0-r2. */
extern void func_0208b0fc(int *, int, int);
extern void func_0208b108(int *in, int *out, int m01, int m23);
extern void func_0208e318(int *out, int a, int b, int c, int d);
extern int func_020b3870(int, int);
extern int func_ov002_0229d0b0(Tbl *tbl, int key);
extern int func_ov002_0229d2c8(void *arg0);

static inline void set_sprite(Sprite *sprite, int x, int y, unsigned flags, int affine, int tile, int priority) {
    switch (flags) {
    case 0x100: case 0x300:
        sprite->attr = (y & 255) | ((affine << 25) | 0x2000) | 0x80000000 | ((x & 511) << 16) | flags;
        break;
    default:
        sprite->attr = ((x & 511) << 16) | ((y & 255) | 0x2000 | 0x80000000) | flags;
    }
    priority <<= 10;
    sprite->tile = ((unsigned)tile >> 7) | priority;
}

void func_ov002_0229d5c0(Node *p) {
    unsigned long flags;
    int tile, affine, x, y, priority;
    int matrix[4], scaled[4];
    Sprite sprite;
    if (p->active == 0) return;
    if (p->view % 8 == 4) return;
    x = p->x - 16;
    y = p->y - 16;
    flags = 0;
    affine = 0;
    if (p->angle % 8 == 0 && p->view == (((unsigned)p->flags << 17) >> 31) * 8) {
        switch (p->angle) {
        case 16: flags |= 0x30000000; break;
        case 8: flags |= 0x100; x--; affine = data_ov002_022d100c[0]; break;
        case 24: flags |= 0x100; y--; affine = data_ov002_022d100c[1]; break;
        }
    } else {
        int c;
        func_0208b0fc(matrix, data_020bef80[((p->angle << 11) >> 4) * 2], data_020bef80[((p->angle << 11) >> 4) * 2 + 1]);
        c = data_020bef80[(((int)(((unsigned)p->view << 29) >> 17)) >> 4) * 2 + 1];
        if (c < 0) c = -c;
        func_0208b108(matrix, scaled, func_020b3870(0x1000000, c), 0x1000);
        flags |= 0x100;
        affine = func_0207ef90(data_ov002_022d0f98, scaled);
    }
    tile = func_ov002_0229d0b0(&data_ov002_022d1014, (p->view + 4) % 16 < 8 ? 0 : p->key);
    priority = 2 - (func_ov002_0229d2c8(p) > 0);
    set_sprite(&sprite, x, y, flags, affine, tile, priority);
    if (p->fade != 0) {
        int a = p->fade - 16;
        if (a < 0) a = -a;
        sprite.attr = (sprite.attr & ~0xc00) | 0x400;
        sprite.tile &= ~0xf000;
        func_0208e318((int *)0x04001050, 0, 0x3f, a, 16-a);
    }
    func_0207f05c(data_ov002_022d0f98, &sprite, 1);
}











