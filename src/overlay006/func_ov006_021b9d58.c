extern int func_020059b0(void *key, void *base, int count, int width,
                         int (*cmp)(void *, void *));
extern int func_ov006_021b9d98(void *a, void *b);
extern char data_ov006_021cb3d4[];

int func_ov006_021b9d58(int unused, int key) {
    int local = key;
    int r = func_020059b0(&local, data_ov006_021cb3d4, 0x1c, 4, func_ov006_021b9d98);
    if (r >= 0x1c)
        r = -1;
    return r;
}
