typedef struct {
    char _pad[0x64];
    unsigned int flag;
} ctx_020919d8_t;
typedef struct {
    char pad_0[0x104];
    ctx_020919d8_t *field_104;
    char pad_108[0xc];
    unsigned int field_114;
} Data_021a84c0_t;
extern Data_021a84c0_t data_021a84c0;
extern void func_020919d8(ctx_020919d8_t *ctx);
void func_0209d438(int a, int b, int c) {
    if (a != 11) return;
    if (c == 0) return;
    *(unsigned int *)((char *)&data_021a84c0 + 0x114) &= ~0x20;
    func_020919d8(data_021a84c0.field_104);
}
