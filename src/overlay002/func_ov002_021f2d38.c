typedef unsigned short u16;
typedef unsigned int u32;

extern int func_ov002_021c23ac(int a, int b);
extern int func_ov002_021c84e0();
extern char data_ov002_022cf16c[];

struct Card2d38 {
    u16 pad0;
    u16 side : 1;
    u16 _pad : 15;
    char pad4[8];
    u16 cost;
};

struct Slot2d38 {
    u32 id : 13;
    u32 rest : 19;
};

int func_ov002_021f2d38(struct Card2d38 *card, int player, int idx)
{
    struct Slot2d38 *slot;
    int v;

    if (card->side != player) {
        return 0;
    }
    if (idx >= 5) {
        return 0;
    }
    slot = (struct Slot2d38 *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20 + 0x30);
    if (slot->id == 0) {
        return 0;
    }
    if (func_ov002_021c23ac(player, idx) == 0) {
        return 0;
    }
    v = func_ov002_021c84e0(player, idx);
    if (v == 0) {
        return 0;
    }
    return (v + card->cost) < 13;
}
