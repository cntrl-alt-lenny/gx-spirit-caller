typedef unsigned int u32;
typedef unsigned short u16;
struct State {
    u32 side:1; u32 pad0:7; u32 card:15; u32 pad1:9;
    int unk4;
    unsigned char count;
    unsigned char pad9[7];
    u16 pair;
};
extern struct State data_ov002_022cd300;
extern unsigned int func_0202b890(int id);
extern int func_ov002_021b9ecc(int player, int index);
extern int func_ov002_021c23ac(int player, int index);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bc288(int player, int index);
extern int func_ov002_021c93cc(int a, int b, int bit);
int func_ov002_0227548c(int player, int a, int b) {
    int id;
    int wanted;
    int index = a + b;
    int i;
    if (index > 10) return 0;
    if (player != data_ov002_022cd300.side) return 0;
    id = func_ov002_021b9ecc(player, index);
    if (id == 0) return 0;
    if (func_ov002_021c23ac(player, index) == 0) return 0;
    if (data_ov002_022cd300.count == 0) {
        switch (data_ov002_022cd300.card) {
        case 0x196b: wanted = 0x18bf; break;
        case 0x196c: wanted = 0x18c0; break;
        case 0x196d: wanted = 0x18c1; break;
        case 0x196e: wanted = 0x18c2; break;
        }
        if (id == wanted) {
            for (i = 0; i <= 4; i++) {
                if (i != index && func_ov002_021c93cc(player, i, func_0202b890(data_ov002_022cd300.card)) != 0) {
                    if (func_ov002_021bc618(player) != 0 || func_ov002_021bc288(player, index) != 0 || func_ov002_021bc288(player, i) != 0) return 0x800;
                }
            }
        }
    } else {
        if (data_ov002_022cd300.pair != (u16)((unsigned char)player | ((unsigned char)index << 8))) {
            if (func_ov002_021c93cc(player, index, func_0202b890(data_ov002_022cd300.card)) != 0) {
                if (func_ov002_021bc618(player) != 0 || func_ov002_021bc288(player, index) != 0 || func_ov002_021bc288(player, (unsigned char)(data_ov002_022cd300.pair >> 8)) != 0) return 0x800;
            }
        }
    }
    return 0;
}

