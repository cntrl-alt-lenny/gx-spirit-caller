typedef unsigned short u16;
typedef struct {
    u16 f0;
    u16 side : 1;
    u16 rest : 15;
} Obj;

extern int func_ov002_02280df4(Obj *o, int a, int b, int c);
extern int func_ov002_021c8470(int a, int b);

int func_ov002_02294370(Obj *self) {
    int slot = func_ov002_02280df4(self, self->side, -1, 0);
    if (slot >= 0) {
        if (func_ov002_021c8470(self->side, slot) >= 0x514) {
            return 1;
        }
    }
    return 0;
}
