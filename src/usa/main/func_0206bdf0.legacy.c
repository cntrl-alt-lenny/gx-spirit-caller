/* func_0206bdf0: if p->field_d == 1, build a struct via func_0209252c,
 * stash it at p->field_8, run func_0206be80, then look the result up via
 * func_020923d8's out-param. Otherwise clear p->field_8 and return
 * func_0206be80's result directly.
 */

extern int func_0206be80(void *self, void *p);
extern void func_0209252c(void *out1, int a1, int a2);
extern int func_020923d8(void *in1, int *out, int flag);

int func_0206bdf0(void *self, char *p) {
    int local8[9];
    int result;
    int local4;

    if (*(signed char *)(p + 0xd) == 1) {
        func_0209252c(local8, (int)&local4, 1);
        *(void **)(p + 0x8) = local8;
        func_0206be80(self, p);
        func_020923d8(local8, &result, 1);
    } else {
        *(void **)(p + 0x8) = 0;
        result = func_0206be80(self, p);
    }
    return result;
}
