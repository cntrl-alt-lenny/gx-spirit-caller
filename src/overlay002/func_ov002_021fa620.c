typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 id; u16 player:1; u16 rest:15; u16 pad[2]; u16 count; } Self;
typedef struct { u32 low:13; u32 flag:1; u32 mid:8; u32 value:8; u32 high:2; } Packed;
extern struct { char pad[0x5b4]; int state; } data_ov002_022ce288;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern void func_ov002_021e1870(int arg0, int idx, int arg2);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern void func_ov002_0226b054(int arg0);
int func_ov002_021fa620(Self *self) {
    Packed *p;
    switch (data_ov002_022ce288.state) {
    case 0:
        if (func_ov002_022536e8((void *)self->player, self->id, 0) == 0) {
            func_ov002_021ae400(self->player, 13);
            data_ov002_022ce288.state = 5;
            return 0;
        }
        func_ov002_021af9d0(self->player, 6, self->id, 0);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        p = (Packed *)func_ov002_021afb74();
        func_ov002_021e1870(self->player, ((Packed *)func_ov002_021afb74())->value * 2 + p->flag, 0);
        self->count = 500;
        data_ov002_022ce288.state = 10;
        return 0;
    case 5:
        func_ov002_0226b054(1 - self->player);
        self->count = 0;
        data_ov002_022ce288.state = 10;
        return 0;
    case 10:
        func_ov002_021e286c(self->player);
        break;
    }
    return 1;
}
