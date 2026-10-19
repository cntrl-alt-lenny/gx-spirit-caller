typedef struct { unsigned int id : 13; } Slot;
typedef struct {
    unsigned int side : 1;
    unsigned int pad0 : 7;
    unsigned int card : 15;
    unsigned int pad1 : 9;
    int unk;
    unsigned char count;
    unsigned char pad2[7];
    unsigned short list[1];
} State;
extern State data_ov002_022cd300;
extern char data_ov002_022cf16c[];
extern int func_ov002_021bc68c(int self);
extern int func_ov002_021bc288(int player, int idx);
extern int func_ov002_02275860(int a0, int a1, int a2);
extern int func_ov002_02275938(int a0, int a1, int a2);
extern int func_ov002_02275a14(int player, int arg1, int arg2);

int func_ov002_02275ab4(int player, int arg1, int arg2) {
    int idx = arg1 + arg2;
    int i;
    unsigned short key;
    if (idx > 10) return 0;
    if (((Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + idx * 20 + 0x30))->id == 0) return 0;
    if (data_ov002_022cd300.count == 0) {
        if (func_ov002_021bc68c(player) == 0) {
            if (player != data_ov002_022cd300.side) return 0;
            if (idx > 4) return 0;
            if (func_ov002_021bc288(player, idx) == 0) return 0;
        }
    } else {

        for (i = 0; i < data_ov002_022cd300.count; i++) {
            key = (unsigned char)player | ((unsigned char)idx << 8);
            if (key == data_ov002_022cd300.list[i]) return 0;
        }
    }
    switch (data_ov002_022cd300.card) {
    case 0x19a3: return func_ov002_02275860(player, arg1, arg2);
    case 0x19a4: return func_ov002_02275938(player, arg1, arg2);
    case 0x19c8: return func_ov002_02275a14(player, arg1, arg2);
    default: return 0;
    }
}


