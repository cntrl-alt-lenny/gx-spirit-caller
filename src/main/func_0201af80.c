typedef struct {
    unsigned int a : 8;
    unsigned int b : 4;
    unsigned int c : 8;
    unsigned int rest : 12;
} Entry;

extern Entry data_020c59ec[1];
extern int func_02018f80(void);
extern int func_02018f90(void);

Entry *func_0201af80(int c) {
    int a = func_02018f80();
    int b = func_02018f90();
    unsigned int i;
    Entry *p = data_020c59ec;

    for (i = 0; i < 1; i++, p++) {
        if (p->a == a && p->b == b && p->c == c) {
            return p;
        }
    }
    return 0;
}
