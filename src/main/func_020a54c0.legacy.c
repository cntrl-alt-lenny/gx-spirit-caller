typedef struct {
    unsigned int unused;
    unsigned short selected;
} Selection;
extern int func_0209e4f8(void);

int func_020a54c0(Selection *p) {
    int mask = func_0209e4f8();
    unsigned short candidate;
    unsigned short i;
    unsigned short original;
    if (mask == 0) return 0;
    original = p->selected;
    i = 0;
    candidate = original;
    do {
        if ((mask & (1 << (candidate - 1))) != 0) {
            if (original != candidate) {
                p->selected = candidate;
                break;
            }
        }
        i++;
        candidate = candidate == 16 ? 1 : candidate + 1;
    } while (i < 16);
    return 1;
}

