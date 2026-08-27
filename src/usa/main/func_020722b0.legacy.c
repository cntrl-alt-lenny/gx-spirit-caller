typedef struct {
    char pad_00[0x1c];
    int field_1c;
} func_02072398_t;

extern char data_021a62f0[];
extern char data_0219f098[];
extern int func_0207232c(int x);
extern void func_02072b90(int a, int b, void *c, int d, int e);
extern void func_02073dc8(int x);
extern void func_02073650(void);

void func_020722b0(func_02072398_t *a0, int a1, int a2) {
    if (func_0207232c(a0->field_1c) == 0) {
        if (*(char **)(data_021a62f0 + 4) == data_0219f098) {
            goto pathA;
        }
    }
    func_02072b90(0, 0, a0, a1, a2);
    return;
pathA:
    func_02073dc8(a0->field_1c);
    func_02073650();
}
