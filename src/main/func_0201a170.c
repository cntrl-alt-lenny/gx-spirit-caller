typedef struct { int values[3]; } Triple;
typedef struct { unsigned short value; unsigned short rest[3]; } Entry;
extern char *GetSystemWork(void);
extern char data_02104f4c[];
extern Entry data_021059cc[];
extern Triple data_020b59e0[];

int func_0201a170(int arg) {
    unsigned int index;
    GetSystemWork();
    index = data_021059cc[arg].value;
    if ((((*(unsigned int *)(data_02104f4c + 0xa64) & 0x1f00000) >> 20) - 1) != arg) {
        switch (arg) {
        case 4: case 8: case 10: case 11: case 14: case 15: return 0;
        case 5: case 6: return 0x1000;
        }
    }
    switch (arg) {
    case 4: { Triple a = data_020b59e0[1]; return a.values[index]; }
    case 5: case 6: { Triple b = data_020b59e0[2]; return b.values[index]; }
    case 8: { Triple c = data_020b59e0[3]; return c.values[index]; }
    case 10: { Triple d = data_020b59e0[4]; return d.values[index]; }
    case 14: case 15: { Triple e = data_020b59e0[5]; return e.values[index]; }
    case 11: { Triple f = data_020b59e0[6]; return f.values[index]; }
    }
    return 0;
}
