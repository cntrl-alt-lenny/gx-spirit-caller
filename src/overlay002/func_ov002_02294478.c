typedef unsigned short u16;
typedef struct {
    u16 f0;
    u16 side : 1;
    u16 pad1 : 11;
    u16 kind : 2;
    u16 flip : 1;
    u16 rest : 1;
} Obj;
extern int func_ov002_0223f6c4(Obj *self);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern int func_ov002_02280df4(Obj *self, int side, int excluded, int mode);
extern int func_ov002_02291160(Obj *self, int arg);
int func_ov002_02294478(Obj *self, int arg) {
    if (self->kind == 0) {
        if (func_ov002_02280df4(self, self->side, -1, 0) >= 0) {
            if (func_ov002_02291160(self, arg)) return 1;
        }
        return 0;
    } else {
        int value = func_ov002_0223f6c4(self);
        return func_ov002_022536e8(self->side ^ self->flip, self->f0, value) > 0;
    }
}

