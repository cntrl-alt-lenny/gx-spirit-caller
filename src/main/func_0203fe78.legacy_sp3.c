typedef unsigned long long u64;
extern char *data_0219d9d4;
extern void func_0203f778(int a);
extern int func_0203fc70(void);
extern int func_0204014c(int arg);
extern void func_020418ac(void *self);
extern void func_02091768(unsigned int delay);
extern void func_02091af4(char *self);
extern void func_02092748(void *self);
extern void func_020927b8(char *self);
extern u64 func_020930b0(void);
extern u64 func_020b3808(u64 a, u64 b);

void func_0203fe78(void) {
    int retries = 0;
    int mode;
    int status;
    u64 start;
    for (;;) {
        if (*(int *)(*(char **)(data_0219d9d4 + 0x1314) + 0x1ba0) != 0)
            func_02091af4(*(char **)(data_0219d9d4 + 0x1314) + 0x1b34);
        status = *(int *)(*(char **)(data_0219d9d4 + 0x1314) + 0x1020);
        if (status != 8) {
            *(int *)(data_0219d9d4 + 0x1008) = 0x4e84;
            status = *(int *)(*(char **)(data_0219d9d4 + 0x1314) + 0x1020);
            if (status == 7) { func_0203f778(20); return; }
            if (retries > 2) {
                if (status == 2) { func_0203f778(9); return; }
                if (status == 3) { func_0203f778(11); return; }
                func_0203f778(13); return;
            }
            ++retries;
            mode = 1;
        } else {
            status = func_0203fc70();
            switch (status) {
            case 21: func_0203f778(21); return;
            case 16:
                if (retries > 2) { func_0203f778(16); return; }
                ++retries;
                mode = 0;
                break;
            case 17: func_0203f778(status); return;
            default:
                if (retries >= 2) { func_0203f778(status); return; }
                ++retries;
                mode = 1;
                break;
            }
        }
        start = func_020930b0();
        while (func_020b3808((func_020930b0() - start) << 6, 0x82ea) < 5000) {
            func_020927b8(data_0219d9d4 + 0x13d8);
            if (*(int *)(data_0219d9d4 + 0x13f0) == 1) {
                *(int *)(data_0219d9d4 + 0x1008) = 0x4e84;
                func_02092748(data_0219d9d4 + 0x13d8);
                func_0203f778(20); return;
            }
            func_02092748(data_0219d9d4 + 0x13d8);
            func_02091768(5000);
        }
        func_020418ac(*(void **)(data_0219d9d4 + 0x1314));
        func_020927b8(data_0219d9d4 + 0x13d8);
        *(int *)(data_0219d9d4 + 0x1004) = func_0204014c(mode);
        if (*(int *)(data_0219d9d4 + 0x1004) != 0) {
            *(int *)(data_0219d9d4 + 0x1008) = 0x4e84;
            func_02092748(data_0219d9d4 + 0x13d8);
            return;
        }
        func_02092748(data_0219d9d4 + 0x13d8);
    }
}
