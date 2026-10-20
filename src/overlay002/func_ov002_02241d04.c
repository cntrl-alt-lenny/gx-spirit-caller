typedef unsigned short u16;
struct Self { u16 id; u16 player:1; u16 rest:15; };
extern int data_ov002_022ce288[];
extern int data_ov002_022cd744[];
extern int data_ov002_022d016c[];
extern int func_ov002_022577dc(void *self);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_0228df3c(struct Self *self, void *other, int id);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_0223fd74(void *arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern void func_ov002_0223dcc0(struct Self *self, int side, int slot);
int func_ov002_02241d04(struct Self *self, void *other) {
    switch (data_ov002_022ce288[0x16e]) {
    case 0:
        if (func_ov002_022577dc(self) < 2) return 1;
        func_ov002_021ae400(self->player, 0x92);
        if (data_ov002_022cd744[self->player] == 1) {
            func_ov002_0228df3c(self, other, self->id);
            data_ov002_022ce288[0x16e] += 2;
            return 0;
        }
        func_ov002_0225935c(self->player, self->id, (int)func_ov002_0223fd74);
        data_ov002_022ce288[0x16e]++;
        return 0;
    case 2:
        func_ov002_021ae400(self->player, 0x93);
        func_ov002_0225935c(self->player, self->id, (int)func_ov002_0223fd74);
        data_ov002_022ce288[0x16e]++;
        return 0;
    case 1:
    case 3:
        if (func_ov002_022593f4() != 0) {
            func_ov002_0223dcc0(self, data_ov002_022d016c[0x35c], data_ov002_022d016c[0x35d] + data_ov002_022d016c[0x35e]);
            data_ov002_022ce288[0x16e]++;
            return 0;
        }
        data_ov002_022ce288[0x16e]--;
        return 0;
    default:
        return 1;
    }
}
