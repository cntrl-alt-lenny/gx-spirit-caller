typedef struct Config {
    int words[16];
    void *(*alloc)(void *, unsigned int);
    int tail;
} Config;
extern char data_020fe67c[];
extern char *data_0219d9d4;
extern int data_0219d9d0;
extern int data_0219d9cc;
extern int func_0204014c(int arg);
extern void func_02040478(void);
extern void func_020945f4(void *, int, unsigned int);

int func_0204052c(Config *config, void *arg) {
    void *(*alloc)(void *, unsigned int) = config->alloc;
    if (data_0219d9d4 != 0) return 2;
    data_0219d9d4 = alloc(data_020fe67c, 0x13f4);
    if (data_0219d9d4 == 0) return 2;
    func_020945f4(data_0219d9d4, 0, 0x13f4);
    *(void **)(data_0219d9d4 + 0x1314) = arg;
    data_0219d9d0 = 0;
    func_020945f4(data_0219d9d4 + 0x1008, 0, 0x1c4);
    *(int *)(data_0219d9d4 + 0x1008) = 0x4e84;
    *(Config *)(data_0219d9d4 + 0x11cc) = *config;
    *(unsigned short *)(data_0219d9d4 + 0x11fe) = 0;
    *(unsigned char *)(data_0219d9d4 + 0x120b) = 0;
    *(int *)(data_0219d9d4 + 0x1004) = func_0204014c(1);
    if (*(int *)(data_0219d9d4 + 0x1004) != 0)
        return *(int *)(data_0219d9d4 + 0x1004);
    data_0219d9cc = 0;
    func_02040478();
    return 0;
}

