extern char data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern unsigned int func_0202b878(int id);
extern int func_ov002_021c38c4(int player, int index);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
struct Entry {
    unsigned int id:13;
    unsigned int flag:1;
    unsigned int pad:8;
    unsigned int index:8;
    unsigned int tail:2;
};
void func_ov002_02250d9c(int player, int unused, int idx) {
    int off = (player & 1) * 0x868;
    struct Entry *entries = (struct Entry *)(off + (unsigned int)data_ov002_022cf16c + 0x120);
    int id = entries[idx].id;
    if (func_0202e234(id) == 0) return;
    if (func_0202b878(id) != 7) return;
    if (func_ov002_021c38c4(player, entries[idx].index * 2 + entries[idx].flag) > 2) return;
    if (func_ov002_021ca440(player, id) == 0) return;
    func_ov002_02253458(player, 11, idx);
}


