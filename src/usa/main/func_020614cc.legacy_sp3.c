extern void *func_02045398(void *param1);

int func_020614cc(char *s, void *param1) {
    *(void **)s = func_02045398(param1);
    if (*(void **)s == 0) {
        return 0;
    }
    *(void **)(s + 4) = param1;
    return 1;
}
