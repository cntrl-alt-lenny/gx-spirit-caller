/* func_ov002_0220c2c0: guard + threshold check. arg1 is forwarded straight
 * through to func_ov002_02207b3c (invisible from this function's own body).
 * Previously catalogued as a predicate-vs-branch wall (brief 356). */

extern int func_ov002_02207b3c(void *self, void *arg1);
extern int func_ov002_022577dc(void *self);

int func_ov002_0220c2c0(void *self, void *arg1) {
    if (func_ov002_02207b3c(self, arg1)) {
        return func_ov002_022577dc(self) >= 2;
    }
    return 0;
}
