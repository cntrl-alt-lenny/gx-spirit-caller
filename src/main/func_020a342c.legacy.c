typedef struct {
    char pad_00[0x24];
    int field_24;
    int field_28;
    char pad_2c[0x48 - 0x2c];
} Buf_t;

extern void func_02098388(void *buf);
extern int func_02098038(void *buf, void *ptr);
extern void func_02097ff0(void *buf);
extern void func_02097f10(void *buf, void *p, int n);

int func_020a342c(void *a0, char *a1, int a2) {
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
    func_02098388(&buf);
    if (func_02098038(&buf, a0) == 0) {
        return 0;
    }
    if (n != buf.field_28 - buf.field_24) {
        func_02097ff0(&buf);
        return 0;
    }
    func_02097f10(&buf, p, n);
    func_02097ff0(&buf);
    return 1;
}
