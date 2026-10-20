typedef unsigned short u16;
typedef unsigned int u32;
struct S {
    u16 id;
    u16 side:1;
    u16 rest:15;
    u16 pad[2];
    u16 low;
    u16 high;
};
extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
extern char data_ov002_022cf16c[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021b9aa8(u32 a, u32 b);
extern void func_ov002_021d7c1c(void *a, void *b, void *c);
extern void func_ov002_021e1870(int arg0, int idx, int arg2);
extern int func_ov002_021e27c0(int self_thing, int arg1);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0226b194(int arg0, int arg1, int arg2);
int func_ov002_0222ee00(struct S *self) {
    u16 value = (unsigned char)self->low | ((unsigned char)self->high << 8);
    int idx;
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (func_ov002_0225368c(1 - self->side, self->id, value) == 0) return 0x78;
        func_ov002_0226b194(1 - self->side, self->id, value);
        return 0x7f;
    case 0x7f:
        idx = func_ov002_021b9aa8(1 - self->side, *(u16 *)(data_ov002_022d0e6c + 0xb2));
        if (idx >= 0) {
            func_ov002_021d7c1c(1 - self->side, data_ov002_022cf16c + ((1 - self->side) & 1) * 0x868 + 0x120 + idx * 4, 1);
        } else {
            func_ov002_021e1870(1 - self->side, *(u16 *)(data_ov002_022d0e6c + 0xb2), 1);
        }
        func_ov002_021e286c(1 - self->side);
        return 0;
    case 0x78:
        func_ov002_021e27c0(1 - self->side, 1);
        return 0x77;
    case 0x77:
        func_ov002_021ae400(self->side, 0xd);
        return 0x76;
    case 0x76:
        func_ov002_0226b054(self->side);
        return 0x75;
    case 0x75:
        func_ov002_021e27c0(1 - self->side, 0);
        func_ov002_021e286c(1 - self->side);
        return 0;
    default:
        return 0;
    }
}

