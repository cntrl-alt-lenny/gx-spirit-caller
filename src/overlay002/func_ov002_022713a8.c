struct State {
    unsigned int player:1;
    unsigned int rest:31;
    unsigned int pad;
    unsigned char count;
    unsigned char padding[7];
    unsigned short entries[3];
    unsigned short unused:1;
    unsigned short flag:1;
    unsigned short other:14;
};
extern struct State data_ov002_022cd300;
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021bc288(int a, int b);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bc72c(int a, int b, int c);
extern int func_ov002_021bc8c8(int a, int b, int c);
int func_ov002_022713a8(int player, int a, int b) {
    int sum = a + b;
    int i;
    unsigned short pair;
    int card;
    if (sum > 4) return 0;
    if (data_ov002_022cd300.flag) {
        if (func_ov002_021bc8c8(data_ov002_022cd300.player, player, sum) == 0) return 0;
    } else {
        if (func_ov002_021bc72c(data_ov002_022cd300.player, player, sum) == 0) return 0;
    }
    if (data_ov002_022cd300.count == 0) {
        card = func_ov002_021b9ecc(player, sum);
        switch (card) {
        case 0x13e5: case 0x13e7: return 0x800;
        default: return 0;
        }
    }
    for (i = 0; i < data_ov002_022cd300.count; i++) {
        pair = (unsigned char)player | ((unsigned char)sum << 8);
        if (pair == data_ov002_022cd300.entries[i]) return 0;
    }
    if (func_ov002_021bc618(data_ov002_022cd300.player) == 0) {
        if ((data_ov002_022cd300.entries[0] & 0xff) != data_ov002_022cd300.player ||
            func_ov002_021bc288(data_ov002_022cd300.entries[0] & 0xff, (data_ov002_022cd300.entries[0] >> 8) & 0xff) == 0) {
            if (player != data_ov002_022cd300.player || func_ov002_021bc288(player, sum) == 0) return 0;
        }
    }
    return 0x800;
}
