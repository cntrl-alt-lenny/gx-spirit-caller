struct Result { int kind, count, a, slot, b, score, c, value; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cd524[];
extern int func_ov002_021c031c(int arg0);
extern int func_ov002_021c034c(int, int, int);
extern int func_ov002_021bae7c(int player, int id, int except);
extern int func_ov002_021bf294(int, int, int, int, int);
extern int func_ov002_02284324(int, int, int, int);
extern void func_ov002_02283c70(int, int, int, int, struct Result *);
extern int func_ov002_0229cd70(int a, int b, int c);
int func_ov002_022848e0(int player, int idx, int arg, struct Result *out, int flag) {
    int opponent, i, replace;
    char *row, *table;
    struct Result tmp;
    if (func_ov002_021c031c(player) ||
        (func_ov002_021c034c(player, idx, 1) && !func_ov002_021bae7c(1-player, 0x17fe, -1))) {
        if (flag || func_ov002_02284324(player, idx, 5, arg)) {
            func_ov002_02283c70(player, idx, 5, flag, out);
            if (flag || out->value > 0) return 1;
            else return 0;
        } else return 0;
    }
    opponent = 1-player;
    row = data_ov002_022cf16c + (opponent & 1)*0x868;
    table = data_ov002_022cd524 + opponent*0xdc;
    out->count = 0; out->kind = 0;
    out->c = 0;
    out->value = -0x10000;
    for(i=0;i<5;i++) {
        if (!func_ov002_021bf294(player, idx, opponent, i, 1)) continue;
        if (!flag && !func_ov002_02284324(player, idx, i, arg)) continue;
        replace = 0;
        func_ov002_02283c70(player, idx, i, flag, &tmp);
        if(flag && out->count == 0) replace = 1;
        if(tmp.count > out->count) replace = 1;
        if(tmp.count == out->count) {
            if(tmp.value > out->value) replace = 1;
            else if(tmp.value == out->value) {
                if(tmp.score > out->score) replace = 1;
                else if(*(unsigned short *)(row + tmp.slot*0x14 + 0x38) == 0) replace = 1;
                else if(*(int *)(table + tmp.slot*0x2c + 0x2c) > *(int *)(table + out->slot*0x2c + 0x2c)) replace = 1;
            }
        }
        if(replace) func_ov002_0229cd70((int)out, (int)&tmp, 0x20);
    }
    return flag || out->count != 0;
}

