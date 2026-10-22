typedef unsigned short u16;
struct Node0223def4 { char _pad[8]; u16 arr8[5]; u16 f18; };
struct Self {
    u16 id;
    u16 side:1; u16 slot:5; u16 kind:6; u16 rest2:4;
    u16 flag:1; u16 pad4:5; u16 value:9; u16 rest4:1;
    u16 f6, f8, fa, fc, fe, f10, f12;
    union { struct { unsigned index:9; unsigned rest:23; } b; struct { unsigned low:16; unsigned high:16; } h; } f14;
};
struct Entry { u16 id:13; u16 rest:3; u16 other; };
extern struct Entry data_ov002_022d0250[];
extern unsigned int func_0202b8a8(int id);
extern int func_ov002_021b3618(int player, int idx);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021b9ecc(int player, int idx);
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
int func_ov002_0223f6c4(struct Self *self) {
    switch (self->id) {
    case 0x140b: case 0x15a3: case 0x1768: case 0x1a8d:
        return self->f8;
    case 0x164a: case 0x16bc: case 0x1745: case 0x1a03:
        return self->slot;
    case 0x169f:
        return func_0202b8a8(data_ov002_022d0250[self->f14.b.index].id);
    case 0x17f5: case 0x198e: case 0x19dc: case 0x19dd:
        return self->fa;
    case 0x179a: case 0x18c5:
        return self->value;
    case 0x187f:
        return data_ov002_022d0250[self->f14.b.index].id;
    case 0x1927:
        return self->fa;
    case 0x1971:
        return self->f14.b.index;
    case 0x197c: {
        int v = func_ov002_021b3618(self->side, self->slot);
        return func_ov002_021c8470((unsigned char)v, (unsigned char)((u16)v >> 8)) | 0x10000000;
    }
    case 0x19b6:
        if (self->kind == 15) return self->f14.h.low;
        break;
    case 0x19d8: {
        int v;
        if (self->f8 != 0) return self->f8;
        v = func_ov002_021b3618(self->side, self->slot);
        return func_ov002_021b9ecc((unsigned char)v, (unsigned char)((u16)v >> 8));
    }
    case 0x1a16:
        return func_0202b8a8(data_ov002_022d0250[self->f14.b.index].id);
    case 0x1a98:
        return self->fc;
    case 0x1b27:
        if (!self->flag) return 0;
        return func_0202b8a8(data_ov002_022d0250[func_ov002_0223def4((struct Node0223def4 *)self, 0)].id);
    }
    return 0;
}
