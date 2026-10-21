typedef struct {
    unsigned int id : 13;
    unsigned int lo : 1;
    unsigned int mid : 8;
    unsigned int hi : 8;
    unsigned int top : 2;
} Card;
typedef struct { char pad[0x120]; Card cards[466]; } Side;
extern Side data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern int func_0202de9c(int unused0);
extern int func_ov002_021c38c4(int a, int b);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);

void func_ov002_0224e6e8(int player, int unused, int idx) {
    int side = (player & 1) * 0x868;
    Card *cards = (Card *)(side + (unsigned int)data_ov002_022cf16c + 0x120);
    int id = cards[idx].id;
    if (func_0202e234(id) == 0) return;
    if (func_0202de9c(id) != 0) return;
    if (func_ov002_021c38c4(player, cards[idx].hi * 2 + cards[idx].lo) != 4) return;
    if (func_ov002_021ca440(player, id) == 0) return;
    func_ov002_02253458(player, 11, idx);
}




