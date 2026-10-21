extern void func_02050054(void *a0, void *a1);

static inline void apply_effect(void *kind, void *sub) {
    if (kind != 0) {
        func_02050054(kind, sub);
    }
}

int func_0204a960(int code) {
    if (code == 0) {
        return 0;
    }
    switch (code) {
    case 1:
        return 1;
    case 2:
        return 2;
    }
    apply_effect((void *)6, (void *)0xfffeb007);
    return code;
}
