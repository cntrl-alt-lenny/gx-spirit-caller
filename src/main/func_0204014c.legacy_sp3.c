typedef struct {
    unsigned long long a;
    unsigned long long b;
    unsigned short info;
    char tail[2];
} Record;
typedef struct {
    char *name;
    int fields[4];
    int flag;
    int tail;
} Settings;
extern Settings data_020fe55c;
extern char data_020fe64c[];
extern char *data_0219d9d4;
extern Record data_0219d9d8;
extern void *data_021a63d0[];
extern int func_020aaf40(const char *, const char *);
extern int func_02042068(void *, Settings *);
extern void func_02044610(Record *rec);
extern int func_0203f7c0(void *, void *, void *);
extern int func_02041fd0(void *arg0);
extern int func_02091814(void *p);
extern void func_02041f04(void *self, int a1);

int func_0204014c(int arg) {
    if (func_020aaf40(data_020fe55c.name, data_020fe64c) != 0) {
        data_020fe55c.flag = 1;
    }
    data_020fe55c.fields[2] = *(int *)(data_0219d9d4 + 0x120c);
    data_020fe55c.fields[3] = *(int *)(data_0219d9d4 + 0x1210);
    if (func_02042068(*(void **)(data_0219d9d4 + 0x1314), &data_020fe55c) != 0) return 4;
    if (arg == 1) func_02044610(&data_0219d9d8);
    *(int *)(data_0219d9d4 + 0x1004) = func_0203f7c0(*(void **)(data_0219d9d4 + 0x1314), data_0219d9d4 + 0x1200, (void *)((unsigned int)data_0219d9d4 + 0x11cc));
    if (*(int *)(data_0219d9d4 + 0x1004) != 0) return 4;
    if (func_02041fd0(*(void **)(data_0219d9d4 + 0x1314)) != 0) return 4;
    func_02041f04(*(void **)(data_0219d9d4 + 0x1314), func_02091814(data_021a63d0[1]) - 1);
    return 0;
}

