typedef struct {
    unsigned long long a;
    unsigned long long b;
} Ids;
typedef void *(*Alloc)(void *, unsigned int);
typedef void (*Free)(void *, void *, int);
extern char *data_0219d9d4;
extern char data_020fe630[];
extern char data_020fe640[];
extern Ids data_0219d9d8;
extern int func_02040e3c(void *, int);
extern int func_0203f968(void);
extern int func_02044e58(Ids *ids, void *arg);
extern int func_02044ea8(void *arg);
extern int func_02044cb8(Ids *ids);

int func_0203fc70(void) {
    Alloc alloc = *(Alloc *)(data_0219d9d4 + 0x120c);
    Free free = *(Free *)(data_0219d9d4 + 0x1210);
    void *p;
    int status;
    if (func_02040e3c(*(void **)(data_0219d9d4 + 0x1314), 0) != 1) {
        *(int *)(data_0219d9d4 + 0x1008) = 0x4e84;
        return 14;
    }
    if (func_0203f968() != 0) return 14;
    status = *(int *)(data_0219d9d4 + 0x1008);
    if (status < 0x4e84) {
        if (status == 0x4e22) {
            p = alloc(data_020fe630, 0x71f);
            if (p == 0) {
                *(int *)(data_0219d9d4 + 0x1008) = 0x4e84;
                return 2;
            }
            if (func_02044e58(&data_0219d9d8, (void *)(((unsigned int)p + 0x1f) & ~0x1f)) != 1) {
                free(data_020fe640, p, 0);
                *(int *)(data_0219d9d4 + 0x1008) = 0x4e84;
                return 15;
            }
            free(data_020fe640, p, 0);
        }
        return 21;
    }
    switch (status) {
    case 0x4e88:
        func_02044cb8(&data_0219d9d8);
        *(int *)(data_0219d9d4 + 0x1008) = 0x4e88;
        return 16;
    case 0x4e8c:
        p = alloc(data_020fe630, 0x700);
        if (p == 0) {
            *(int *)(data_0219d9d4 + 0x1008) = 0x4e8c;
            return 17;
        }
        func_02044ea8((void *)(((unsigned int)p + 0x1f) & ~0x1f));
        free(data_020fe640, p, 0);
        *(int *)(data_0219d9d4 + 0x1008) = 0x4e8c;
        return 17;
    }
    return 18;
}
