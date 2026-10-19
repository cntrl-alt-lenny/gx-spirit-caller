typedef struct { int f_0; volatile int f_4; int f_8; int f_c; } state_021_4clear_t;
typedef struct { void *(*alloc)(const void *, int); int b; int c; } Config;
extern char *data_0219d9f0;
extern void *data_0219d9fc;
extern int data_0219d9f8;
extern char data_020feba4[];
extern char data_020febb8[];
extern void func_020945f4(void *, int, unsigned int);
extern void func_02092844(state_021_4clear_t *p);
extern void func_02043168(void);
int func_020433d0(Config *arg) {
    void *(*alloc)(const void *, int) = arg->alloc;
    if (data_0219d9f0 != 0) return 4;
    data_0219d9f0 = alloc(data_020feba4, 0x11f4);
    if (data_0219d9f0 == 0) return 4;
    func_020945f4(data_0219d9f0, 0, 0x11f4);
    *(int *)(data_0219d9f0 + 0x1004) = 0xfffe7961;
    *(Config *)(data_0219d9f0 + 0x1108) = *arg;
    if (data_0219d9fc != 0) return 4;
    data_0219d9fc = alloc(data_020febb8, 0x1c10);
    if (data_0219d9fc == 0) return 4;
    data_0219d9f8 = 0;
    func_02092844((state_021_4clear_t *)(data_0219d9f0 + 0x11dc));
    func_02043168();
    return 0;
}
