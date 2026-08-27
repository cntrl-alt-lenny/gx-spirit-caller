/* func_0206c3f8: build via func_0206c30c, register a bf94 callback slot
 * against func_0206c380, then compose through func_0206bdb4. */

extern void *func_0206c30c(void *param0);
extern void *func_0206bf20(void *cb, void *self, int flag);
extern int func_0206bdb4(int a, int b);
extern void func_0206c380(void);

int func_0206c3f8(void *param0) {
    void *r4 = func_0206c30c(param0);
    if (r4 == 0) {
        return ~0x30;
    }
    void *p = func_0206bf20((void *)func_0206c380, r4, 1);
    func_0206bdb4((int)r4, (int)p);
    return (int)r4;
}
