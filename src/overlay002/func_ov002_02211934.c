typedef unsigned short u16;

typedef struct {
    u16 id;
    u16 flag : 1;
} Obj;

typedef struct {
    char pad[0x5a8];
    int state;
} Data;

extern Data data_ov002_022ce288;
extern void func_ov002_021d479c(u16 a, int b, int c, int d);
extern int func_ov002_021e286c(int a);

int func_ov002_02211934(Obj *self) {
    switch (data_ov002_022ce288.state) {
    case 0x80:
        return 0x7f;
    case 0x7f:
        func_ov002_021d479c((self->flag ? 0x8000 : 0) | 0x5a, 1, 0, 0);
        return 0x7e;
    case 0x7e:
        func_ov002_021e286c(self->flag);
        return 0;
    }
    return 0;
}
