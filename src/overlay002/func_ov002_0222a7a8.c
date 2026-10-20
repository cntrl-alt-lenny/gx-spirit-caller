typedef unsigned short u16;
typedef unsigned int u32;
struct F2 { u16 player:1; u16 idx:5; u16 rest:10; };
struct F4 { u16 pad:6; u16 field:9; u16 top:1; };
struct Node { u16 id; struct F2 f2; struct F4 f4; };
struct Slot { u32 id:13; u32 flag:1; u32 pad:8; u32 sub:8; u32 top:2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern struct State { char pad[0x5a8]; int mode; } data_ov002_022ce288;
extern struct Count { char pad[0xd44]; u32 count; } data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern u32 *func_ov002_021b004c(int id);
extern int func_ov002_021ca698(int arg0, int arg1);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern void func_ov002_021d8128(int arg0, void *arg1, int arg2);
extern int func_ov002_0223f6c4(struct Node *self);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
int func_ov002_0222a7a8(struct Node *self) {
    struct Slot *slot;
    int off, idx, field, r;
    u32 i;
    off = (self->f2.player & 1) * 0x868;
    idx = self->f2.idx;
    field = self->f4.field;
    slot = (struct Slot *)(data_ov002_022cf16c + off + 0x30 + idx * 20);
    if (field != slot->sub * 2 + slot->flag) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + off + idx * 20) == 0) return 0;
    switch (data_ov002_022ce288.mode) {
    case 0x80:
        if (func_ov002_021ca698(self->f2.player, self->f2.player) == 0) return 0;
        r = func_ov002_0223f6c4(self);
        if (func_ov002_0225368c(self->f2.player, self->id, r) == 0) return 0;
        func_ov002_021ae400(self->f2.player, 0x56);
        return 0x7f;
    case 0x7f:
        func_ov002_021af9d0(self->f2.player, 0x29, self->id, 0);
        return 0x7e;
    case 0x7e:
        for (i = 0; i < data_ov002_022d016c.count; i++) {
            func_ov002_021d8128(self->f2.player, func_ov002_021b004c(i + 1), 0);
        }
        func_ov002_021d59cc(self->f2.player, self->f2.idx, self->id, 0x12, (u16)(data_ov002_022d016c.count * 0x12c));
        return 0;
    }
    return 0;
}
