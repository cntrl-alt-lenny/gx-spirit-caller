extern char data_ov002_022cf090[];
extern char data_ov002_022cf094[];

int func_ov002_021b9130(int bit0) {
    int idx = (bit0 & 1) * 0x868;
    int old = *(int *)(data_ov002_022cf090 + idx);
    unsigned int inc = old + 1;

    *(int *)(data_ov002_022cf090 + idx) = inc;
    if (inc < 0x80) {
        return old;
    }

    *(int *)(data_ov002_022cf090 + idx) = *(int *)(data_ov002_022cf094 + idx) + 2;
    return old;
}
