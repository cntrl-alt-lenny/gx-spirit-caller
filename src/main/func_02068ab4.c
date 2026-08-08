/* func_02068ab4: soft-assert self!=0. Look up self->field_18 via
 * func_0205442c(handle, &b); if found, return result->f4, else return
 * the caller-supplied fallback c. */

extern void func_020a6d54(const char *file, const char *msg, int zero, int line);
extern char data_02101d68[];
extern char data_02101d70[];
extern void *func_0205442c(void *handle, int *outparam);

typedef struct {
    char _pad_18[0x18];
    void *field_18;
} Obj02068ab4;

typedef struct {
    char _pad_4[0x4];
    int f4;
} Result02068ab4;

int func_02068ab4(Obj02068ab4 *self, int b, int c) {
    Result02068ab4 *result;
    int local[2];

    if (self == 0) {
        func_020a6d54(data_02101d68, data_02101d70, 0, 0x97);
    }
    if (self == 0) return 0;

    local[0] = b;
    result = func_0205442c(self->field_18, local);
    if (result != 0) {
        c = result->f4;
    }
    return c;
}
