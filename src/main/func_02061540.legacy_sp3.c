extern void *func_020453e8(void *param1);

int func_02061540(char *s, void *param1) {
    *(void **)s = func_020453e8(param1);
    if (*(void **)s == 0) {
        return 0;
    }
    *(void **)(s + 4) = param1;
    return 1;
}
