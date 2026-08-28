/* func_02068a40: soft-assert self!=0. Look up self->field_18 via
 * func_020543b8(handle, &b); if found, return result->f4, else return
 * the caller-supplied fallback c. */

extern void func_020a6c60(const char *file, const char *msg, int zero, int line);
extern char data_02101c88[];
extern char data_02101c90[];
extern void *func_020543b8(void *handle, int *outparam);

typedef struct {
    char _pad_18[0x18];
    void *field_18;
} Obj02068ab4;

typedef struct {
    char _pad_4[0x4];
    int f4;
} Result02068ab4;

int func_02068a40(Obj02068ab4 *self, int b, int c) {
    Result02068ab4 *result;
    int local[2];

    if (self == 0) {
        func_020a6c60(data_02101c88, data_02101c90, 0, 0x97);
    }
    if (self == 0) return 0;

    local[0] = b;
    result = func_020543b8(self->field_18, local);
    if (result != 0) {
        c = result->f4;
    }
    return c;
}
