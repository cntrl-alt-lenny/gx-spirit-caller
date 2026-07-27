struct Rec02297d08 {
    unsigned int a;
    void *b;
};

extern const struct Rec02297d08 data_ov002_022c99c0[];
extern int func_0202e1e0(unsigned int x);
extern int func_ov002_0228bbc0(void *thing, const struct Rec02297d08 *rec, int z);

int func_ov002_02297bf8(void *thing) {
    unsigned int i;
    for (i = 0; i < 0x114; i++) {
        if (func_0202e1e0(data_ov002_022c99c0[i].a)) {
            if (func_ov002_0228bbc0(thing, &data_ov002_022c99c0[i], 0))
                return 1;
        }
    }
    return 0;
}
