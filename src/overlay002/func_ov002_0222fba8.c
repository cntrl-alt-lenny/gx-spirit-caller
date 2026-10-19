struct Slot { unsigned int id:13; unsigned int player:1; unsigned int rest:18; unsigned int other[4]; };
struct State { int pad; int player; int pad2[6]; int idx; };
struct Self { unsigned short x; unsigned short player:1; unsigned short rest:15; };
extern struct State data_ov002_022cd3f4;
extern int data_ov002_022cd744[];
extern unsigned char data_ov002_022ce288[];
extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022d016c[];
extern int func_ov002_021ae484(int x);
extern int func_ov002_021de4b0(int arg0, int arg1, int arg2);
extern int func_ov002_021de528(int self, int player, int idx);
int func_ov002_0222fba8(int self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80: {
        struct Slot *slot = (struct Slot *)(data_ov002_022cf16c + (data_ov002_022cd3f4.player & 1) * 0x868 + 0x30);
        slot += data_ov002_022cd3f4.idx;
        if (slot->id == 0) return 0;
        if (data_ov002_022cd3f4.player != slot->player) {
            *(int *)(data_ov002_022d016c + 0xd44) = 0;
        } else if (data_ov002_022cd744[((struct Self *)self)->player] == 1) {
            *(int *)(data_ov002_022d016c + 0xd44) = 1;
        } else {
            func_ov002_021ae484(0x137);
        }
        return 0x7f;
    }
    case 0x7f:
        if (*(int *)(data_ov002_022d016c + 0xd44)) {
            func_ov002_021de528(self, data_ov002_022cd3f4.player, data_ov002_022cd3f4.idx);
        } else {
            func_ov002_021de4b0(self, data_ov002_022cd3f4.player, data_ov002_022cd3f4.idx);
        }
        break;
    }
    return 0;
}
