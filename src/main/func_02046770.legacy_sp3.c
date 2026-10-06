extern char *data_0219daec;
extern void *func_02046888(int key);
extern unsigned char func_02046858(void);
extern void *func_020467e4(int i);

void *func_02046770(int id, int count) {
    unsigned char i;
    for (i = 0; i < count; i++) {
        if (id == *(int *)(data_0219daec + i * 4 + 0x448)) {
            break;
        }
    }
    if (i >= count) {
        return 0;
    }
    func_02046888(*(unsigned char *)(data_0219daec + i + 0x624));
    return func_020467e4(func_02046858());
}
