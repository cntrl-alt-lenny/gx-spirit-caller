extern int func_0207f05c(void *queue, const void *sprite, int count);
extern int func_020b3870(int numerator, int denominator);
extern unsigned char data_ov002_022d0f98[];
typedef struct { unsigned int attr; unsigned short tile; unsigned short pad; } Sprite;
typedef struct {
    int unk0, x, y, unkC, choice, mode, value, selected, unk20;
    unsigned char active;
    unsigned char pad25[7];
    int offset, min, max, unk38, position, start, end;
} Obj;
void func_ov002_022ad5d8(Obj *p) {
    Sprite s;
    int v;
    int x, y;
    if (!p->active) return;
    s.attr = 0x80006400;
    s.tile = 0x5000;
    if (p->mode == 3) v = p->value;
    else v = func_020b3870((p->max - p->min) * (p->position - p->start) + (p->end - p->start) / 2, p->end - p->start);
    x = p->x + p->offset;
    x += v;
    y = p->y + 3;
    s.attr = (s.attr & 0xfe00ff00) | (y & 0xff) | ((unsigned)(x << 23) >> 7);
    s.tile = (s.tile & ~0x3ff) | ((0x11200 + ((p->selected != -1) << 9)) / 128);
    func_0207f05c(data_ov002_022d0f98, &s, 1);
    y = p->y + 3;
    x = p->x;
    s.attr = (s.attr & 0xfe00ff00) | (y & 0xff) | ((unsigned)(x << 23) >> 7);
    s.tile = (s.tile & ~0x3ff) | ((0x11600 + ((p->choice == -1) << 9)) / 128);
    func_0207f05c(data_ov002_022d0f98, &s, 1);
    y = p->y + 3;
    x = p->max + (p->x + p->offset);
    s.attr = (s.attr & 0xfe00ff00) | (y & 0xff) | ((unsigned)(x << 23) >> 7);
    s.tile = (s.tile & ~0x3ff) | ((0x11a00 + ((p->choice == 1) << 9)) / 128);
    func_0207f05c(data_ov002_022d0f98, &s, 1);
}



