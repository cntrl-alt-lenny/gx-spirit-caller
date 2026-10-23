struct SlotId {
    unsigned int id:13;
    unsigned int flag13:1;
    unsigned int pad14:8;
    unsigned int val8:8;
    unsigned int pad30:2;
};
struct Event {
    unsigned int id:9;
    unsigned int player:1;
    unsigned int zero:1;
    unsigned int side:1;
    unsigned int kind:4;
    unsigned int rest:16;
};
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
extern void func_ov002_02244fe4(int a, unsigned int b);
void func_ov002_021d7b44(int player, struct SlotId *slot, int flag) {
    struct Event event = {0};
    event.id = slot->flag13 + (slot->val8 << 1);
    event.player = player;
    event.zero = 0;
    event.side = player ^ ((flag & 1) > 0);
    event.kind = 15;
    func_ov002_021d479c(0x33 | (player ? 0x8000 : 0), 11, flag, slot->flag13 + (slot->val8 << 1));
    func_ov002_02244fe4(30, *(unsigned int *)&event);
}

