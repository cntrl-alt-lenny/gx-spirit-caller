extern int func_02005994(void *key, void *base, int count, int width,
                         int (*cmp)(void *, void *));
extern int func_ov006_021b9c98(void *a, void *b);
extern char data_ov006_021cb2c8[];

int func_ov006_021b9c58(int unused, int key) {
    int local = key;
    int r = func_02005994(&local, data_ov006_021cb2c8, 0x1c, 4, func_ov006_021b9c98);
    if (r >= 0x1c)
        r = -1;
    return r;
}
