typedef struct {
    unsigned int bit0 : 1;
    unsigned int mid_bits : 22;
    unsigned int top9 : 9;
} Data_t;
extern Data_t data_ov002_022cd300;
extern char data_ov002_022cf1a8[];

extern int func_ov002_021bb068(int id);
extern int func_ov002_021baca8(int player, int sum, int id);
extern int func_ov002_021c38c4(int bit0, int top9);

int func_ov002_02271710(int player, int a, int b) {
    int sum = a + b;

    if (data_ov002_022cd300.bit0 != player) {
        return 0;
    }
    if (sum < 5) {
        return 0;
    }
    if (sum >= 10) {
        return 0;
    }
    if (func_ov002_021bb068(0x13f2) != 0) {
        return 0;
    }
    if (func_ov002_021baca8(player, sum, 0x19b2) == 0) {
        goto ret0;
    }
    {
        int cmp7 = func_ov002_021c38c4(data_ov002_022cd300.bit0, data_ov002_022cd300.top9);
        int limit = (cmp7 >= 7 ? 1 : 0) + 1;
        int row = (data_ov002_022cd300.bit0 & 1) * 0x868;
        int val = *(int *)(data_ov002_022cf1a8 + row + sum * 20);
        if ((unsigned int)val >= (unsigned int)limit) {
            return 0x800;
        }
    }
ret0:
    return 0;
}
