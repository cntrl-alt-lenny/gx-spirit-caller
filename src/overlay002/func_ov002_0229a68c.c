typedef struct {
    char pad[0xb88];
    int mode;
    int field_b8c;
    unsigned int rounds;
    int field_b94;
    int field_b98;
    int result;
    char pad_ba0[0x14];
    int extra;
} DuelState;
typedef struct {
    int field_00;
    int player;
    int field_08;
    int field_0c;
    int state;
} RoundState;
extern DuelState data_021040ac;
extern RoundState data_ov002_022cd73c;
extern unsigned int data_02104c40[];

void func_ov002_0229a68c(int result, int reason) {
    int active = 1;
    if (data_021040ac.mode != 1 && data_021040ac.mode != 2) active = 0;
    if (active == 0) {
        data_021040ac.result = result;
        return;
    }
    switch (result) {
    case 1:
        if (++data_02104c40[data_ov002_022cd73c.player] >= 2 || reason == 8) {
            data_021040ac.result = 1;
            return;
        }
        data_ov002_022cd73c.state = 4;
        break;
    case 2:
        if (++data_02104c40[data_ov002_022cd73c.player ^ 1] >= 2 || reason == 8) {
            data_021040ac.result = 2;
            return;
        }
        data_ov002_022cd73c.state = 3;
        break;
    default:
        data_ov002_022cd73c.state = 2;
        break;
    }
    if (data_021040ac.rounds < 2 && data_021040ac.extra != 0) return;
    {
        int difference = data_02104c40[data_ov002_022cd73c.player] - data_02104c40[data_ov002_022cd73c.player ^ 1];
        if (difference > 0) {
            data_021040ac.result = 1;
            return;
        }
        if (difference < 0) {
            data_021040ac.result = 2;
            return;
        }
        if (data_021040ac.extra < 0) data_021040ac.result = 3;
    }
}

