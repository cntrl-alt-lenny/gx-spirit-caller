extern short *data_ov007_021b30b8[][8];
int func_ov007_021b2e84(int *ctx) {
    short *list;
    int i;
    int value;
    short **row;
    if (ctx[1] == 0) return 0;
    row = (short **)((ctx[4] << 5) + (unsigned int)data_ov007_021b30b8);
    row += ctx[5];
    list = row[5];
    for (i = 0; ; i++) {
        value = list[i];
        if (value < 0) return 0;
        if (ctx[8] == value) return 1;
    }
}


