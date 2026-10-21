typedef unsigned short u16;
typedef unsigned int u32;
struct F2 { u16 player:1; u16 idx:5; u16 rest:10; };
struct F4 { u16 pad:6; u16 field:9; u16 top:1; };
struct Node { u16 id; struct F2 f2; struct F4 f4; };
struct Slot { u32 id:13; u32 flag:1; u32 pad:8; u32 sub:8; u32 top:2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
int func_ov002_0222a9d0(struct Node *self) {
    int player = self->f2.player;
    int off = (player & 1) * 0x868;
    int idx = self->f2.idx;
    int field = self->f4.field;
    struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + off + 0x30 + idx * 20);
    if (field != slot->sub * 2 + slot->flag) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + off + idx * 20) != 0) {
        func_ov002_021d59cc(player, idx, 0x16cb, 4, 0);
    }
    return 0;
}
