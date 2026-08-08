/* func_0206be64: if p->field_d == 1, build a struct via func_02092614,
 * stash it at p->field_8, run func_0206bef4, then look the result up via
 * func_020924c0's out-param. Otherwise clear p->field_8 and return
 * func_0206bef4's result directly.
 */

extern int func_0206bef4(void *self, void *p);
extern void func_02092614(void *out1, int a1, int a2);
extern int func_020924c0(void *in1, int *out, int flag);

int func_0206be64(void *self, char *p) {
    int local8[9];
    int result;
    int local4;

    if (*(signed char *)(p + 0xd) == 1) {
        func_02092614(local8, (int)&local4, 1);
        *(void **)(p + 0x8) = local8;
        func_0206bef4(self, p);
        func_020924c0(local8, &result, 1);
    } else {
        *(void **)(p + 0x8) = 0;
        result = func_0206bef4(self, p);
    }
    return result;
}
