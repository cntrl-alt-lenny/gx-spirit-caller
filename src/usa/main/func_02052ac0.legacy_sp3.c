extern int func_02045230(void);
extern int func_02046964(void *a0);
extern int func_020466ac(void *a0);
extern int func_020522dc(void *a0);
extern int func_02051ea8(void *a0);
extern int func_02052690(int a1);

int func_02052ac0(void *a0, int a1) {
    if (func_02045230() != 0) {
        goto fail;
    }
    if (a1 == 1 && func_02046964(a0) == 0) {
        goto fail;
    }
    if (func_020466ac(a0) != 0) {
        goto success;
    }

fail:
    return 0;

success:
    if (func_020522dc(a0) == 1) {
        return 0;
    }
    return func_02051ea8(a0) >= func_02052690(a1);
}
