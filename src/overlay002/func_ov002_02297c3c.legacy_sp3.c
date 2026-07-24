/* func_ov002_02297c3c: scan 185 (0xB9) 8-byte records; return 1 on first
 * callback hit. mwcc SRs &table[i] to a +8 walker, keeps i for the bound. */
struct Rec02297c3c {
    unsigned int a;
    void *b;
};

extern const struct Rec02297c3c data_ov002_022c9508[];
extern int func_ov002_02297158(void *thing, const struct Rec02297c3c *rec);

int func_ov002_02297c3c(void *thing) {
    const struct Rec02297c3c *rec;
    unsigned int i;
    for (i = 0, rec = data_ov002_022c9508; i < 0xb9; i++, rec++) {
        if (func_ov002_02297158(thing, rec))
            return 1;
    }
    return 0;
}
