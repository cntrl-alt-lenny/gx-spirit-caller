extern void func_02044610(void *out);

typedef struct {
    long long field_0;
    long long field_8;
    int field_10;
} func_02044c10_buf_t;

int func_02044c10(void) {
    func_02044c10_buf_t buf;
    func_02044610(&buf);
    if (buf.field_8 == 0) {
        if (buf.field_0 == 0) {
            return 1;
        }
    }
    return 0;
}
