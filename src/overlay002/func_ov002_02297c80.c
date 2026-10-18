struct Rec02297c80 {
    unsigned int a;
    void *b;
};

extern const struct Rec02297c80 data_ov002_022c8ff0[];
extern const struct Rec02297c80 data_ov002_022c9010[];
extern int func_ov002_02297158(void *thing, const struct Rec02297c80 *rec);

int func_ov002_02297c80(void *thing, int flag) {
    unsigned int i;
    const struct Rec02297c80 *rec;
    for (i = 0, rec = data_ov002_022c8ff0; i < 4; i++, rec++) {
        if (func_ov002_02297158(thing, rec))
            return 1;
    }
    if (flag != 0)
        return 0;
    {
        const struct Rec02297c80 *rec2;
        unsigned int j;
        for (j = 0, rec2 = data_ov002_022c9010; j < 5; j++, rec2++) {
            if (func_ov002_02297158(thing, rec2))
                return 1;
        }
    }
    return 0;
}
