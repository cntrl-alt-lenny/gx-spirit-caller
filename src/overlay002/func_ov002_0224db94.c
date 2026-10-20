typedef struct Slot {
    unsigned int id : 13;
    unsigned int flag : 1;
    unsigned int pad : 8;
    unsigned int kind : 8;
    unsigned int rest : 2;
} Slot;
typedef struct Side { char pad[0x120]; Slot slots[466]; } Side;
extern Side data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern int func_ov002_021b9128(int a, int b);
extern int func_ov002_021ca5bc(int arg0);
extern void func_ov002_02253458(int player, int kind, int idx);

void func_ov002_0224db94(int player, int arg1, int idx) {
    int side = player & 1;
    int offset = side * 0x868;
    Slot *row = (Slot *)(offset + (int)data_ov002_022cf16c);
    row = (Slot *)((char *)row + 0x120);
    unsigned int id = row[idx].id;
    if (func_0202e234(id) != 0) {
        if (func_ov002_021b9128(id, 1) != 0) {
            if (func_ov002_021ca5bc(row[idx].kind * 2 + row[idx].flag) != 0) {
                func_ov002_02253458(player, 11, idx);
            }
        }
    }
}









