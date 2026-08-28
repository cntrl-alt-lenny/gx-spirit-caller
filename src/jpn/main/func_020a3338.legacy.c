typedef struct {
    char pad_00[0x24];
    int field_24;
    int field_28;
    char pad_2c[0x48 - 0x2c];
} Buf_t;

extern void func_02098294(void *buf);
extern int func_02097f44(void *buf, void *ptr);
extern void func_02097efc(void *buf);
extern void func_02097e1c(void *buf, void *p, int n);

int func_020a3338(void *a0, char *a1, int a2) {
    Buf_t buf;
    int n;
    char *p;

    n = (a2 != 0) ? 0x200 : 0x20;
    p = a1;
    if (a2 != 0) {
        p = a1 + 0x20;
    }
    if (a0 == 0) {
        return 0;
    }
    func_02098294(&buf);
    if (func_02097f44(&buf, a0) == 0) {
        return 0;
    }
    if (n != buf.field_28 - buf.field_24) {
        func_02097efc(&buf);
        return 0;
    }
    func_02097e1c(&buf, p, n);
    func_02097efc(&buf);
    return 1;
}
