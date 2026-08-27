extern void func_020445c0(void *out);

typedef struct {
    long long field_0;
    long long field_8;
    int field_10;
} func_02044c10_buf_t;

int func_02044bc0(void) {
    func_02044c10_buf_t buf;
    func_020445c0(&buf);
    if (buf.field_8 == 0) {
        if (buf.field_0 == 0) {
            return 1;
        }
    }
    return 0;
}
