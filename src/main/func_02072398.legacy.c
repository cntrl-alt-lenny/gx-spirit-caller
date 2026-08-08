typedef struct {
    char pad_00[0x1c];
    int field_1c;
} func_02072398_t;

extern char data_021a63d0[];
extern char data_0219f178[];
extern int func_02072414(int x);
extern void func_02072c78(int a, int b, void *c, int d, int e);
extern void func_02073eb0(int x);
extern void func_02073738(void);

void func_02072398(func_02072398_t *a0, int a1, int a2) {
    if (func_02072414(a0->field_1c) == 0) {
        if (*(char **)(data_021a63d0 + 4) == data_0219f178) {
            goto pathA;
        }
    }
    func_02072c78(0, 0, a0, a1, a2);
    return;
pathA:
    func_02073eb0(a0->field_1c);
    func_02073738();
}
