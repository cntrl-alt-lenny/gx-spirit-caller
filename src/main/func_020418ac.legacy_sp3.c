typedef void (*fn_02041470_t)(void *a, int v, int z);
typedef struct {
    char _pad[0x1014];
    fn_02041470_t fn;
} ctx_02041470_t;
typedef struct { void *label; void *value; } Entry;
extern void func_02040cc0(char *self, Entry *entries, int n);
extern void func_02041470(ctx_02041470_t *ctx, int *p);
extern void func_020945f4(void *p, int b, int c);
extern void *data_020fe978;
extern void *data_020fe990;
void func_020418ac(char *self) {
    fn_02041470_t fn = *(fn_02041470_t *)(self + 0x1014);
    if (self == 0) return;
    func_02040cc0(self, (Entry *)(self + 0x1a34), 0x20);
    func_02041470((ctx_02041470_t *)self, (int *)(self + 0x1a04));
    func_02041470((ctx_02041470_t *)self, (int *)(self + 0x19f4));
    if (*(int *)(self + 0x19c8) != 0) {
        fn(&data_020fe978, *(int *)(self + 0x19c8), 0);
        *(int *)(self + 0x19c8) = 0;
    }
    if (*(int *)(self + 0x19cc) != 0) {
        fn(&data_020fe990, *(int *)(self + 0x19cc), 0);
        *(int *)(self + 0x19cc) = 0;
    }
    func_020945f4(self, 0, 0x1c10);
}
