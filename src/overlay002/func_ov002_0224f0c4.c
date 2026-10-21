struct Slot {
    unsigned id : 13;
    unsigned lo : 1;
    unsigned mid : 8;
    unsigned hi : 8;
    unsigned rest : 2;
};
struct State { char pad[0x48c]; struct Context *context; };
struct Context { char pad[0xc]; unsigned short value; };
struct Player { char pad[0x120]; struct Slot slots[466]; };
extern struct Player data_ov002_022cf16c[];
extern struct State data_ov002_022ce288;
extern int func_0202e234(int x);
extern unsigned int func_0202b878(int id);
extern int func_ov002_021c38c4(int player, int index);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0224f0c4(int player, int unused, int idx) {
    int stride = 0x868;
    char *base = (char *)data_ov002_022cf16c;
    int side = player & 1;
    unsigned int offset = side * stride;
    struct Slot *slots;
    offset += (unsigned int)base;
    slots = (struct Slot *)(offset + 0x120);
    int id = slots[idx].id;
    if (func_0202e234(id) == 0) return;
    if (func_0202b878(id) != 11) return;
    if (func_ov002_021c38c4(player, slots[idx].hi * 2 + slots[idx].lo) != data_ov002_022ce288.context->value) return;
    if (func_ov002_021ca440(player, id) == 0) return;
    func_ov002_02253458(player, 11, idx);
}
