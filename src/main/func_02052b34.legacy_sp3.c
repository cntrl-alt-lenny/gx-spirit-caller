extern int func_02045280(void);
extern int func_020469d0(void *a0);
extern int func_02046718(void *a0);
extern int func_02052350(void *a0);
extern int func_02051f1c(void *a0);
extern int func_02052704(int a1);

int func_02052b34(void *a0, int a1) {
    if (func_02045280() != 0) {
        goto fail;
    }
    if (a1 == 1 && func_020469d0(a0) == 0) {
        goto fail;
    }
    if (func_02046718(a0) != 0) {
        goto success;
    }

fail:
    return 0;

success:
    if (func_02052350(a0) == 1) {
        return 0;
    }
    return func_02051f1c(a0) >= func_02052704(a1);
}
