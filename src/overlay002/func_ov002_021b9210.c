extern char data_ov002_022cf170[];
extern char data_ov002_022cf174[];

int func_ov002_021b9210(int bit0) {
    int idx = (bit0 & 1) * 0x868;
    int old = *(int *)(data_ov002_022cf170 + idx);
    unsigned int inc = old + 1;

    *(int *)(data_ov002_022cf170 + idx) = inc;
    if (inc < 0x80) {
        return old;
    }

    *(int *)(data_ov002_022cf170 + idx) = *(int *)(data_ov002_022cf174 + idx) + 2;
    return old;
}
