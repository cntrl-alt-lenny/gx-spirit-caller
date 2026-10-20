
extern unsigned int func_0202b878(int id);
extern int func_0202e234(int x);
extern int func_ov002_021ca5bc(int arg0);
extern void func_ov002_02253458(int player, int kind, int index);

typedef struct {
    unsigned int id : 13;
    unsigned int side : 1;
    unsigned int pad : 8;
    unsigned int slot : 8;
    unsigned int pad2 : 2;
} Slot;
typedef struct { char pad[0x120]; Slot slots[466]; } Player;
extern Player data_ov002_022cf16c[];



void func_ov002_0224b1e0(int player, int id, int index) {
    int old = data_ov002_022cf16c[player & 1].slots[index].id;
    unsigned int attr;
    if (!func_0202e234(old)) return;
    attr = func_0202b878(old);
    if (attr != func_0202b878(id)) return;
    if (!func_ov002_021ca5bc(data_ov002_022cf16c[player & 1].slots[index].slot * 2 + data_ov002_022cf16c[player & 1].slots[index].side)) return;
    func_ov002_02253458(player, 11, index);
}
