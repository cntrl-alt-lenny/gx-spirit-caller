typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { int x, y; } Vec;
typedef struct { u32 attr; u16 tile; u16 pad; Vec pos; } Sprite;
typedef struct { u16 side:1; u16 index:5; u16 other:10; } Bits;
typedef struct { char pad[0x5ec]; u16 values[11]; } Obj;
extern struct { char pad[0x38]; u32 flags; } data_021040ac;
extern char data_ov002_022d0f98[];
extern void func_ov002_021c820c(int side, int index, u16 *out);
extern void func_ov002_022a6e04(Vec *out, void *self, int side, int index, int offset);
extern int func_0207f05c(void *ctx, Sprite *sprite, int count);
void func_ov002_022a9b6c(char *self) {
    int i, j;
    int v; char *p;
    Vec pos;
    Sprite sprite;
    if (((Bits *)(self + 0x590))->index > 10) return;
    if (*(u16 *)(self + 0x5ec) == 0xffff)
        func_ov002_021c820c(((Bits *)(self + 0x590))->side, ((Bits *)(self + 0x590))->index, (u16 *)(self + 0x5ec));
    p = self;
    for (i = 0; i < 2; i++) {
        for (j = 0; j <= 10; j++) {
            v = ((Obj *)p)->values[j];
            if ((v & 0x100) > 0) {
                if (data_021040ac.flags & 8) v = 6;
                else v &= 0xff;
            }
            if (v != 0) {
                func_ov002_022a6e04(&pos, self, i, j, 0);
                int tile = (v - 1) * 0x100 + 0xb280;
                sprite.pos.x = pos.x;
                sprite.attr = (((pos.x - 8) & 0x1ff) << 16) | (((pos.y - 8) & 0xff) | 0x40002000);
                sprite.tile = (tile / 128) | 0x1400;
                sprite.pos.y = pos.y;
                func_0207f05c(data_ov002_022d0f98, &sprite, 1);
            }
        }
        p += 0x16;
    }
}




