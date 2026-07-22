typedef struct {
    char pad0[2];
    unsigned short pad_low : 6;
    unsigned short field : 6;
    unsigned short pad_high : 4;
} S02200630;

int func_ov002_02200630(S02200630 *p) {
    unsigned short field = p->field;
    if (field != 6 && field != 7) {
        return 0;
    } else {
        return 1;
    }
}
