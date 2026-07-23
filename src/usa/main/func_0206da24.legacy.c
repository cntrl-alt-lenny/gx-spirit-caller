typedef struct {
    unsigned char pad[0x73];
    signed char field_73;
} Inner_0206da98;

typedef struct {
    char pad[4];
    Inner_0206da98 *inner;
} Outer_0206da98;

extern void func_02070b58(void);

int func_0206da24(Outer_0206da98 *p) {
    Inner_0206da98 *inner = p->inner;
    signed char val = inner->field_73;
    int shouldCall = 1;

    if (val != 0) {
        shouldCall = (val == 4);
    }
    if (shouldCall) {
        func_02070b58();
    }
    return 0;
}
