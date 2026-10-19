typedef unsigned short u16;
struct Ov002Self;
struct Self { u16 f0; u16 bit0:1; u16 bits1:5; u16 rest:10; };
extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
extern char data_ov002_022d016c[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021de408(int a, int b);
extern int func_ov002_021de4b0(int arg0, int arg1, int arg2);
extern int func_ov002_021e96a0(struct Ov002Self *self, int player, int idx);
extern int func_ov002_021efac8(struct Ov002Self *self, int player, int idx);
extern unsigned int func_ov002_02257750(void *ctx, int (*cb)(void *, int, int));
extern int func_ov002_02257878();
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern int func_ov002_0226b258();
int func_ov002_02229b54(struct Self *self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        func_ov002_0226b258(self->bit0, self->bits1);
        return 0x7f;
    case 0x7f:
        switch (*(u16 *)(data_ov002_022d0e6c + 0xb0)) {
        case 1: case 2:
            func_ov002_021de408((int)self, func_ov002_02257750(self, (int (*)(void *, int, int))func_ov002_021e96a0));
            break;
        case 3: case 4: case 5:
            if (func_ov002_02257878((int)self, (int)func_ov002_021e96a0)) return 0x7e;
            break;
        case 6:
            func_ov002_021de408((int)self, func_ov002_02257750(self, (int (*)(void *, int, int))func_ov002_021efac8));
            break;
        }
        return 0;
    case 0x7e:
        func_ov002_021ae400(self->bit0, 0x62);
        func_ov002_0225935c(self->bit0, self->f0, (int)func_ov002_021e96a0);
        return 0x7d;
    case 0x7d:
        if (func_ov002_022593f4() == 0) return 0x7e;
        func_ov002_021de4b0((int)self, *(int *)(data_ov002_022d016c + 0xd70), *(int *)(data_ov002_022d016c + 0xd74) + *(int *)(data_ov002_022d016c + 0xd78));
        return 0;
    }
    return 0;
}

