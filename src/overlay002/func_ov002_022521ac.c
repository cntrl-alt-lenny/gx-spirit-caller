extern int func_0202ed90(int a0);
extern int func_ov002_021c38c4(int player, int index);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int index);
extern char data_ov002_022cf16c[];
struct Slot {
    unsigned int id:13;
    unsigned int flag:1;
    unsigned int pad:8;
    unsigned int index:8;
    unsigned int tail:2;
};
void func_ov002_022521ac(int player, int unused, int idx)
{
    int offset = (player & 1) * 0x868;
    struct Slot *row = (struct Slot *)(offset + (unsigned int)data_ov002_022cf16c + 0x120);
    int id = row[idx].id;
    if (func_0202ed90(id) == 0) return;
    if (func_ov002_021c38c4(player, row[idx].index * 2 + row[idx].flag) > 4) return;
    if (func_ov002_021ca440(player, id) == 0) return;
    func_ov002_02253458(player, 11, idx);
}
