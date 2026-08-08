/* func_0206b47c: look up the singleton's entry for p1, soft-assert if
 * not found, else decrement its refcount; once it hits zero, tear it
 * down via func_020544c8. */

extern void func_020a6d54(const char *file, const char *msg, int zero, int line);
extern void *func_02068c08(void *unused);
extern void *func_0205442c(void *handle, int *outparam);
extern void func_020544c8(void *handle, int *outparam);
extern char data_02101e3c[];
extern char data_02101db0[];

typedef struct {
    char _pad_4[0x4];
    volatile int f4;
} Result0206b47c;

void func_0206b47c(void *self, int p1) {
    int local[3];
    Result0206b47c *result;

    local[0] = p1;
    result = func_0205442c(func_02068c08(self), local);

    if (result == 0) {
        func_020a6d54(data_02101e3c, data_02101db0, 0, 0xf4);
    }
    if (result == 0) return;

    result->f4 -= 1;
    if (result->f4 != 0) return;

    func_020544c8(func_02068c08(self), local);
}
