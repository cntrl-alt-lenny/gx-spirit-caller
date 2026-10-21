typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0:1; };
struct Self0220e650 { u16 f0; u16 b0:1; u16 mid:13; u16 b14:1; u16 b15:1; u16 _pad4; u16 f6_lo:8; u16 f6_hi:8; };
struct Slot { char head[0x30]; unsigned int id:13; unsigned int rest:19; int pad; u16 value; char tail[10]; };
extern struct { char pad[0x5a8]; int state; } data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern int func_ov002_021bd364(int player, int arg1);
extern int func_ov002_021d5a08(struct Ov002Self *arg0, int arg1, int arg2, int arg3, u16 arg4, u16 arg5);
extern int func_ov002_0220e650(struct Self0220e650 *self);
int func_ov002_0221ea24(struct Ov002Self *self) {
    int total;
    int i;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_0220e650((struct Self0220e650 *)self)) return 0x7f;
        break;
    case 0x7f:
        total = 0;
        total += func_ov002_021bd364(self->b0, 0xb) * 200;
        total += func_ov002_021bd364(self->b0, 0xd) * 200;
        total += func_ov002_021bd364(self->b0, 0x10) * 200;
        if (total == 0) return 0;
        for (i = 0; i < 5; i++) {
            struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + ((1 - self->b0) & 1) * 0x868 + i * 20);
            if (slot[0].id && slot[0].value) {
                func_ov002_021d5a08(self, 1 - self->b0, i, self->f0, 2, (u16)total);
            }
        }
        break;
    }
    return 0;
}

