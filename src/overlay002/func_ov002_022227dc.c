typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
struct Self { u16 card; u16 side:1; u16 :15; u16 f4; u16 low:8; u16 kind:8; };
struct Node0223def4 { char pad[8]; u16 arr8[5]; u16 f18; };
struct Record { u32 card:13; u32 bit:1; u32 pad:8; u32 value:8; u32 pad2:2; };
struct Player { char pad[0x418]; struct Record records[0x114]; };
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_021bc618(int arg0);
/* The original supplies only r0 to this four-argument thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
extern int func_ov002_021b947c(u32 key);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_0227ac64(int a, struct Record *b, int c, int d, u32 e);
int func_ov002_022227dc(struct Self *self) {
    int value;
    u16 low;
    u8 side, kind;
    u16 high;
    if (func_ov002_021bc618(self->side) == 0) return 0;
    if (func_ov002_021ca2b8(self->side) == 0) return 0;
    if (self->kind == 1) {
        value = func_ov002_021b947c(func_ov002_0223def4((struct Node0223def4 *)self, 0));
        low = value;
        kind = low >> 8;
        side = value;
        high = (u32)value >> 16;
        if (kind == 14) {
            if (func_ov002_021c33e4(self->side, side, high) != 0) {
                struct Record *record;
                int offset = high * 4;
                record = (struct Record *)((char *)&data_ov002_022cf16c[side & 1] + 0x418 + offset);
                func_ov002_0227ac64(self->side, record, 1, 1, (u32)self->card << 16);
                return 0x7f;
            }
        }
    }
    return 0;
}



