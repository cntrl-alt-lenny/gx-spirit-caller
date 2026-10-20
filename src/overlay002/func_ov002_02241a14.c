typedef unsigned short u16;
struct Self { u16 id; u16 player:1; u16 slot:5; u16 rest:10; u16 pad[2]; u16 value; };
struct S0223dad0;
extern int data_ov002_022ce288[];
extern int data_ov002_022d016c[];
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int player, int event, int id, int arg3);
extern int func_ov002_021d90c0(int flag, int arg1, int arg2);
extern void func_ov002_0223dad0(struct S0223dad0 *self, unsigned short val);
extern int func_ov002_0226b0d0(int arg0, int arg1, int arg2);
int func_ov002_02241a14(struct Self *self) {
    switch (data_ov002_022ce288[0x16e]) {
    case 0:
        func_ov002_021ae400(self->player, 0x91);
        data_ov002_022ce288[0x16e]++;
        return 0;
    case 1:
        switch (self->id) {
        case 0x1368:
            func_ov002_021af9d0(self->player, 0x4b, self->id, 0);
            break;
        case 0x1568:
            func_ov002_021af9d0(self->player, 0x4d, self->id, 0);
            break;
        case 0x15de:
        case 0x169d:
        case 0x16d3:
        case 0x1803:
            func_ov002_021af9d0(self->player, 0x4c, self->id, 0);
            break;
        }
        data_ov002_022ce288[0x16e]++;
        return 0;
    case 2:
        func_ov002_0223dad0((struct S0223dad0 *)self, (u16)data_ov002_022d016c[0x351]);
        func_ov002_021d90c0(self->player, self->slot, self->value);
        data_ov002_022ce288[0x16e]++;
        return 0;
    case 3:
        func_ov002_0226b0d0(1 - self->player, self->id, self->value);
        return 1;
    default:
        return 1;
    }
}
