/* func_0206b408: look up the singleton's entry for p1, soft-assert if
 * not found, else decrement its refcount; once it hits zero, tear it
 * down via func_02054454. */

extern void func_020a6c60(const char *file, const char *msg, int zero, int line);
extern void *func_02068b94(void *unused);
extern void *func_020543b8(void *handle, int *outparam);
extern void func_02054454(void *handle, int *outparam);
extern char data_02101d5c[];
extern char data_02101cd0[];

typedef struct {
    char _pad_4[0x4];
    volatile int f4;
} Result0206b47c;

void func_0206b408(void *self, int p1) {
    int local[3];
    Result0206b47c *result;

    local[0] = p1;
    result = func_020543b8(func_02068b94(self), local);

    if (result == 0) {
        func_020a6c60(data_02101d5c, data_02101cd0, 0, 0xf4);
    }
    if (result == 0) return;

    result->f4 -= 1;
    if (result->f4 != 0) return;

    func_02054454(func_02068b94(self), local);
}
