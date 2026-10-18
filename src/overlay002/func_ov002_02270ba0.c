struct Slot { unsigned int id:13; unsigned int rest:19; char pad[16]; };
struct State { unsigned int player:1; unsigned int rest:31; int pad4; unsigned char count; char pad9[7]; unsigned short list[1]; };
extern struct State data_ov002_022cd300;
extern char data_ov002_022cf16c[];
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bc288(int a, int b);
extern int func_ov002_022707b8(int a, int b, int c);
int func_ov002_02270ba0(int player, int a, int b) {
    int sum = a + b;
    int i;
    unsigned short key;
    if (sum > 4) return 0;
    if (((struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x30))[sum].id == 0) return 0;
    if (data_ov002_022cd300.count == 0) {
        if (func_ov002_021bc618(data_ov002_022cd300.player) == 0) {
            if (player != data_ov002_022cd300.player) return 0;
            if (func_ov002_021bc288(player, sum) == 0) return 0;
        }
    } else {

        for (i = 0; i < data_ov002_022cd300.count; i++) {
            key = (unsigned char)player | ((unsigned char)sum << 8);
            if (key == data_ov002_022cd300.list[i]) return 0;
        }
    }
    return func_ov002_022707b8(player, a, b);
}

