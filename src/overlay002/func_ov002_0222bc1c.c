struct Self { unsigned short id; unsigned short side:1; unsigned short rest:15; };
extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
extern void func_ov002_021d87dc(int arg0);
extern void func_ov002_021e2818(int player);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
extern void func_ov002_0226b094(int arg0, int arg1);
extern int func_ov002_0226b194(int arg0, int arg1, int arg2);
int func_ov002_0222bc1c(struct Self *self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (!func_ov002_0225368c(1 - self->side, self->id, 0)) return 0x78;
        func_ov002_0226b194(1 - self->side, self->id, 0);
        return 0x7f;
    case 0x7f:
        func_ov002_021e286c(1 - self->side);
        func_ov002_021d479c((unsigned short)(((1 - self->side) ? 0x8000 : 0) | 0x57), 0xd, *(unsigned short *)(data_ov002_022d0e6c + 0xb2), 0);
        func_ov002_021e2818(1 - self->side);
        func_ov002_021d87dc(1 - self->side);
        func_ov002_021e2818(1 - self->side);
        return 0;
    case 0x78:
        func_ov002_0226b094(1 - self->side, self->id);
        return 0x77;
    case 0x77:
        func_ov002_0226b054(self->side);
        return 0x76;
    case 0x76:
        func_ov002_021e286c(1 - self->side);
        return 0;
    default:
        return 0;
    }
}
