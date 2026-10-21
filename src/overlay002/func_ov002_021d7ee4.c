typedef unsigned int u32;
typedef unsigned short u16;
struct SlotId { u32 id:13; u32 flag13:1; u32 pad:8; u32 val8:8; u32 pad30:2; };
struct State { u16 pad; u16 player:1; u16 rest:15; };
extern int func_ov002_021b9a30(u32 a, u32 b);
extern int func_0202e2c8(int unused0);
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern int func_ov002_021e278c(int arg0, int arg1);
struct PlayerData { u32 value; char rest[0x864]; };
extern struct PlayerData data_ov002_022cf178[];
int func_ov002_021d7ee4(struct State *self, u32 player, struct SlotId *slot) {
    u32 value;
    u16 flag;
    u32 different;
    u32 kind;
    u16 p1;
    u16 p2;
    struct PlayerData *entry;
    u32 composite;
    if (func_ov002_021b9a30(player, slot->flag13 + (slot->val8 << 1)) >= 0) {
        different = self->player == player ? 0 : 1;
        flag = player & 1;
        value = data_ov002_022cf178[flag].value;
        kind = func_0202e2c8(slot->id) ? 0xc : 0xb;
        composite = slot->flag13 + (slot->val8 << 1);
        p1 = (u16)(((composite << 22) >> 16) | (flag | 0x1e));
        p2 = (u16)((flag | ((kind << 27) >> 26)) | ((value << 22) >> 16));
        func_ov002_021d479c(0x3f, p1, p2, different);
        if (func_0202e2c8(slot->id) == 0)
            func_ov002_021e278c(self->player, slot->flag13 + (slot->val8 << 1));
        return 1;
    }
    return 0;
}















