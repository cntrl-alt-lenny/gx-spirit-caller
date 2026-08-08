/* func_0206c46c: build via func_0206c380, register a bf94 callback slot
 * against func_0206c3f4, then compose through func_0206be28. */

extern void *func_0206c380(void *param0);
extern void *func_0206bf94(void *cb, void *self, int flag);
extern int func_0206be28(int a, int b);
extern void func_0206c3f4(void);

int func_0206c46c(void *param0) {
    void *r4 = func_0206c380(param0);
    if (r4 == 0) {
        return ~0x30;
    }
    void *p = func_0206bf94((void *)func_0206c3f4, r4, 1);
    func_0206be28((int)r4, (int)p);
    return (int)r4;
}
