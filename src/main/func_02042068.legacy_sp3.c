typedef void *(*AllocFn)(const char *label, int size);
typedef struct { char *data; char *cur; char *end; int size; } Buffer;
typedef struct { char *name; int a; int size; AllocFn alloc; int b; int c; int d; } Params;
extern char data_020fe9e4[];
extern char data_020fe9fc[];
extern void func_020945f4(void *dst, int value, unsigned size);
extern int func_020414b0(char *self, Buffer *buf, int size);
extern int func_02041248(char *self, const char *name);
extern int func_020417e8(char *self);
int func_02042068(char *self, Params *params) {
    AllocFn alloc = params->alloc;
    func_020945f4(self, 0, 0x1c10);
    *(int *)(self + 0x1a2c) = -1;
    *(int *)(self + 0x1a30) = -1;
    *(Params *)(self + 0x1004) = *params;
    *(void **)(self + 0x19c8) = alloc(data_020fe9e4, 0xb68);
    if (*(void **)(self + 0x19c8) == 0) { *(int *)(self + 0x1020) = 1; return 1; }
    *(void **)(self + 0x19cc) = alloc(data_020fe9fc, 0x5ea);
    if (*(void **)(self + 0x19cc) == 0) { *(int *)(self + 0x1020) = 1; return 1; }
    if (func_020414b0(self, (Buffer *)(self + 0x1a04), *(int *)(self + 0x100c)) == 0) { *(int *)(self + 0x1020) = 1; return 1; }
    if (func_02041248(self, params->name) == 0) { *(int *)(self + 0x1020) = 1; return 1; }
    *(int *)(self + 0x1020) = func_020417e8(self);
    if (*(int *)(self + 0x1020) == 0) *(unsigned char *)(self + 0x1000) = 0xff;
    return *(int *)(self + 0x1020);
}

