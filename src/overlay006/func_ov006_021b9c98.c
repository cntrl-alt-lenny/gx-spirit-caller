extern int func_020059b0(void *key, void *base, int count, int width, int (*cmp)(unsigned short *, unsigned short *));
extern int func_ov006_021b9d1c(unsigned short *a, unsigned short *b);
extern signed char data_ov006_021cb4f8[];
extern void *data_ov006_021cbbc8[4];

int func_ov006_021b9c98(int unused, int key) {
    unsigned short local;
    int result;
    if ((unsigned int)key < 0x100)
        return data_ov006_021cb4f8[key];
    local = ((key >> 8) & 0xff) | ((unsigned char)key << 8);
    result = func_020059b0(&local, data_ov006_021cbbc8[1], 0xb1, 2, func_ov006_021b9d1c);
    if (result >= 0xb1)
        return -1;
    return ((signed char *)data_ov006_021cbbc8[3])[result] - 1;
}

