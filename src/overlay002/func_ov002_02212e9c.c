typedef struct {
    unsigned short id;
    unsigned short side : 1;
    unsigned short rest : 15;
    unsigned short flags : 2;
    unsigned short blocked : 1;
} Obj;
struct State { char pad[0x5a8]; int mode; };
struct Slot { int value; char pad[0x864]; };
extern struct State data_ov002_022ce288;
extern struct Slot data_ov002_022cf178[];
extern void func_ov002_021d7970(void *arg0, int arg1, int arg2);
extern int func_ov002_021e104c();
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
int func_ov002_02212e9c(Obj *self) {
    int side;
    if (self->blocked) return 0;
    switch (data_ov002_022ce288.mode) {
    case 0x80:
        side = self->side;
        if (data_ov002_022cf178[side & 1].value == 0) return 0x7f;
        func_ov002_021d7970((void *)side, 0, 0);
        return 0x80;
    case 0x7f:
        side = 1 - self->side;
        if (data_ov002_022cf178[side & 1].value == 0) return 0x7e;
        func_ov002_021d7970((void *)side, 0, 1);
        return 0x7f;
    case 0x7e:
        func_ov002_021e2b3c();
        func_ov002_021e104c(self->side, 5);
        return 0x7d;
    case 0x7d:
        func_ov002_021e104c(1 - self->side, 5);
        func_ov002_021e2c5c();
        return 0x7c;
    }
    return 0;
}

