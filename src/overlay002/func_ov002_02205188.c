typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    u16 id;
    u16 side:1; u16 pad:5; u16 kind:6; u16 rest:4;
    u16 pad4:6; u16 field6_9:9; u16 pad5:1;
} S021ff2c8;
typedef struct {
    u32 id:13; u32 low:1; u32 pad:8; u32 high:8; u32 rest:2;
    char tail[16];
} Entry;
extern char data_ov002_022cf17c[];
extern char data_ov002_022cf16c[];
/* The original caller also supplies a zero in r2 beyond the two fixed arguments. */
extern int func_ov002_021c2330(int self, int arg1, ...);
extern int func_ov002_021ff2c8(S021ff2c8 *p, int arg1);
int func_ov002_02205188(S021ff2c8 *self) {
    int i;
    u32 base;
    Entry *p;
    int offset;
    int side = self->side;
    unsigned int off = (side & 1) * 0x868;
    if (*(u32 *)(data_ov002_022cf17c + off) < 2) return 0;
    if (self->kind != 0x23) {
        p = (Entry *)(data_ov002_022cf16c + off + 0x30);
        for (i = 0, offset = 0, base = (u32)p; i <= 10; i++, p++, offset += 20) {
            if (p->id != 0 && self->field6_9 != ((Entry *)(base + offset))->high * 2 + ((Entry *)(base + offset))->low)
                return func_ov002_021c2330(side, i, 0) != 0;
        }
        return func_ov002_021ff2c8(self, side) != 0;
    }
    return 1;
}





