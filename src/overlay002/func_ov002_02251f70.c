struct Slot { unsigned id:13; unsigned side:1; unsigned pad:8; unsigned index:8; unsigned rest:2; };
extern char data_ov002_022cf16c;
extern unsigned int func_0202b878(int id);
extern int func_0202f2e4(int x);
extern int func_ov002_021c38c4(int side, int index);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_02251f70(unsigned player, int unused, unsigned idx) {
    struct Slot *slots;
    unsigned id;
    int base;
    int side;
    unused = player & 1;
    unused *= 0x868;
    base = (int)&data_ov002_022cf16c;
    unused += base;
    slots = (struct Slot *)(unused + 0x120);
    id = slots[idx].id;
    if (func_0202f2e4(id) != 0 &&
        func_0202b878(id) == 7 &&
        func_ov002_021c38c4(player, slots[idx].index * 2 + slots[idx].side) <= 4 &&
        func_ov002_021ca440(player, id) != 0)
        func_ov002_02253458(player, 11, idx);
}



