typedef struct { const char *key; char *value; } KeyValue;
typedef struct { char pad[0x1a34]; KeyValue entries[0x20]; } Table;
extern char *data_0219d9d4;
extern int data_0219d9d0, data_021aa460;
extern char data_020fe5dc[], data_020fe5e4[], data_020fe5f0[], data_020fe5fc[];
extern char data_020fe604[], data_020fe60c[], data_020fe618[], data_020fe624[];
extern char *func_02040de8(Table *table, const char *key);
extern int func_020434e4(const char *s);
/* Original passes only r0, fewer arguments than the thunk definition. */
extern int func_020ace00();
extern int func_02040d94(void *self, const char *key, char *buf, unsigned size);
extern int func_02040d54(int arg0, int arg1, int arg2, int arg3);
extern int func_020acd38(const char *str, char **endptr, int base);
extern int func_020aaddc(const char *s);

int func_0203f968(void) {
    char *end = 0;
    int status;
    int value;
    end = func_02040de8(*(Table **)(data_0219d9d4 + 0x1314), data_020fe5dc);
    if (end != 0) func_020434e4(end);
    end = 0;
    data_021aa460 = 0;
    status = func_020ace00((int)func_02040de8(*(Table **)(data_0219d9d4 + 0x1314), data_020fe5e4));
    if (data_021aa460 == 0x22) {
        *(int *)(data_0219d9d4 + 0x1008) = 0x4e85;
        return 12;
    }
    if (status != 200) {
        *(int *)(data_0219d9d4 + 0x1008) = status + 0x59d8;
        return 18;
    }
    if (func_02040d94(*(void **)(data_0219d9d4 + 0x1314), data_020fe5f0, data_0219d9d4 + 0x100c, 4) <= 0) {
        *(int *)(data_0219d9d4 + 0x1008) = 0x4e85;
        return 14;
    }
    value = func_020acd38(data_0219d9d4 + 0x100c, &end, 10);
    if (end != data_0219d9d4 + 0x100c + func_020aaddc(data_0219d9d4 + 0x100c)) {
        *(int *)(data_0219d9d4 + 0x1008) = 0x4e85;
        return 12;
    }
    *(int *)(data_0219d9d4 + 0x1008) = value + 0x4e20;
    if (value < 100) {
        data_0219d9d4[0x1052] = 0;
        data_0219d9d4[0x101f] = 0;
        data_0219d9d4[0x117f] = 0;
        data_0219d9d4[0x1010] = 0;
        data_0219d9d4[0x1188] = 0;
        func_02040d94(*(void **)(data_0219d9d4 + 0x1314), data_020fe5fc, data_0219d9d4 + 0x1052, 0x12d);
        func_02040d94(*(void **)(data_0219d9d4 + 0x1314), data_020fe604, data_0219d9d4 + 0x101f, 0x33);
        func_02040d94(*(void **)(data_0219d9d4 + 0x1314), data_020fe60c, data_0219d9d4 + 0x117f, 9);
        func_02040d94(*(void **)(data_0219d9d4 + 0x1314), data_020fe618, data_0219d9d4 + 0x1010, 15);
        func_02040d54((int)*(void **)(data_0219d9d4 + 0x1314), (int)data_020fe624, (int)(data_0219d9d4 + 0x1188), 0x41);
        data_0219d9d4[0x11b3] = 0;
        if (value != 40) data_0219d9d0 = 1;
        else data_0219d9d0 = 2;
    }
    return 0;
}

