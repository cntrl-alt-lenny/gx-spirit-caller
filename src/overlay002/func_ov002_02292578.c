typedef unsigned short u16;
struct Obj {
    u16 id;
    u16 player : 1;
    u16 pad : 11;
    u16 state : 2;
    u16 rest : 2;
};
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_021bcf18(int a, int b, int c, int d);
extern int func_ov002_02291160(struct Obj *self, int arg1);
int func_ov002_02292578(struct Obj *self, int arg1)
{
    if (self->state != 0) {
        if (func_ov002_021bcf18(1 - self->player, 1, 0, 0) != 0) return 0;
        return func_ov002_021bbf50(1 - self->player) == 0;
    }
    return func_ov002_02291160(self, arg1);
}
