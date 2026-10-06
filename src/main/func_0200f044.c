typedef struct {
    char pad[0x80];
    int f80;
    unsigned int on : 1;
    unsigned int b1 : 1;
    unsigned int b2 : 1;
    unsigned int b3 : 1;
    unsigned int b4 : 1;
    unsigned int f5 : 1;
    unsigned int val : 16;
    unsigned int rest : 10;
} Obj_0200f044;

int func_0200f044(Obj_0200f044 *o, int mode, unsigned int val, int flag) {
    if (o != 0 && o->f80 != 0) {
        o->on = 1;
        o->f5 = flag;
        switch (mode) {
        case 0:
            val = 0;
        case 6:
            o->val = val;
        case 5:
            o->b1 = 0;
            o->b2 = 0;
            o->b3 = 0;
            o->b4 = 0;
            break;
        case 1:
            o->b1 = 1;
            o->b2 = 0;
            o->b4 = 0;
            break;
        case 2:
            o->b2 = 1;
            o->b1 = 0;
            o->b3 = 0;
            break;
        case 3:
            o->b3 = 1;
            o->b2 = 0;
            break;
        case 4:
            o->b4 = 1;
            o->b1 = 0;
            break;
        }
        return 1;
    }
    return 0;
}
