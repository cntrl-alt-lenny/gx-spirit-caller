struct Ov002Slot {
    unsigned int id : 13;
    unsigned int flag : 1;
    unsigned int pad : 8;
    unsigned int group : 8;
    unsigned int pad2 : 2;
};
extern char data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern unsigned int func_0202b878(int id);
extern int func_ov002_021ca5bc(int arg0);
extern void func_ov002_02253458(int a, int b, int c);
void func_ov002_02251bb0(int player, int unused, int idx) {
    int offset = (player & 1) * 0x868;
    struct Ov002Slot *row = (struct Ov002Slot *)(offset + (int)data_ov002_022cf16c + 0x120);
    int id = row[idx].id;
    if (func_0202e234(id) == 0) return;
    if (func_0202b878(id) != 17) return;
    if (func_ov002_021ca5bc(row[idx].group * 2 + row[idx].flag) == 0) return;
    func_ov002_02253458(player, 11, idx);
}










