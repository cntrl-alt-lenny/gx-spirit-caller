typedef struct {
    char _pad0[0xf4];
    int ids[1]; /* +0xf4 */
} Ctx;

extern void *func_020498f0(void);
extern void func_0204fa7c(int index, int count);

int func_0204fc38(int key, int count) {
    int i;
    if (func_020498f0() == 0) {
        return 0;
    }
    for (i = 0; i < count; i++) {
        if (key == ((Ctx *)func_020498f0())->ids[i]) {
            func_0204fa7c(i, count);
            return 1;
        }
    }
    return 0;
}
