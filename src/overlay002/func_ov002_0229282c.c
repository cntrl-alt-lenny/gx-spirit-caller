typedef unsigned short u16;

typedef struct {
    u16 pad0;
    u16 low : 12;
    u16 mode : 2;
    u16 high : 2;
} Obj;

extern int func_ov002_02292754(Obj *obj, int arg);
extern int func_ov002_02257b48(Obj *obj, int arg);

int func_ov002_0229282c(Obj *obj, int arg)
{
    int r;
    if (obj->mode == 0) {
        if (func_ov002_02292754(obj, arg) == 0) {
            return 0;
        }
        obj->mode = 3;
        r = func_ov002_02257b48(obj, arg);
        obj->mode = 0;
        return r;
    }
    return 1;
}
