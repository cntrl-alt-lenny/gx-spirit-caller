typedef struct { unsigned short id; unsigned short bit0:1; unsigned short rest:15; } Self;
extern struct { char pad[0x5b4]; int state; } data_ov002_022ce288;
extern struct { char pad[0xd70]; int a; int b; int c; } data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021decdc(void *arg0, int arg1, int arg2);
extern int func_ov002_021f40f4(unsigned short *p);
extern int func_ov002_022575c8(int a0, int a1, int a2);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern int func_ov002_0226aea8(int arg0, int arg1, int arg2, int arg3);
int func_ov002_021fa968(Self *self) {
    switch (data_ov002_022ce288.state) {
    case 0:
        func_ov002_021ae400(self->bit0, 0x3a);
        func_ov002_0225935c(self->bit0, self->id, (int)func_ov002_022575c8);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        if (func_ov002_022593f4()) {
            func_ov002_021decdc(self, data_ov002_022d016c.a, data_ov002_022d016c.b + data_ov002_022d016c.c);
            data_ov002_022ce288.state++;
            return 0;
        } else {
            data_ov002_022ce288.state--;
            return 0;
        }
    case 2:
        func_ov002_0226aea8(self->bit0, func_ov002_021f40f4(&self->id), 0, 0);
        return 1;
    default:
        return 1;
    }
}
