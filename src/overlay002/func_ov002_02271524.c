struct State {
    unsigned int player:1;
    unsigned int rest:31;
    unsigned int pad;
    unsigned char count;
    unsigned char padding[7];
    unsigned short entries[3];
};
extern struct State data_ov002_022cd300;
extern int func_ov002_021bc288(int a, int b);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bc8c8(int self, int player, int slot);
int func_ov002_02271524(int player, int a, int b) {
    int sum = a + b;
    int i;
    unsigned short pair;
    if (sum > 4) return 0;
    if (player != 1 - data_ov002_022cd300.player) return 0;
    if (func_ov002_021bc8c8(player, player, sum) == 0) return 0;
    if (data_ov002_022cd300.count == 0) {
        if (func_ov002_021bc618(1 - data_ov002_022cd300.player) == 0) {
            if (func_ov002_021bc288(player, sum) == 0) return 0;
        }
    } else {
        for (i = 0; i < data_ov002_022cd300.count; i++) {
            pair = (unsigned char)player | ((unsigned char)sum << 8);
            if (pair == data_ov002_022cd300.entries[i]) return 0;
        }
    }
    return 0x800;
}
