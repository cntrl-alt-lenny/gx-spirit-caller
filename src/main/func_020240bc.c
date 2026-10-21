typedef struct { char pad0[0x68]; short v[16]; } Obj;
typedef struct { short x,y,z; } Tri;
typedef struct {
    unsigned int *pc;
    int ticks;
    char pad[0x60];
    struct { Tri v; short color; } slots[4];
} Context;
extern int func_02021cd8(Context *o);
extern int func_020224c0(char *base, int mode, int val);
extern int func_02024368(Obj *o);
extern void func_0208c04c(short *v, short *out);
int func_020240bc(Context *o) {
    unsigned int *start = o->pc;
    Tri v;
    int index, red, green, blue;
    while (func_02021cd8(o) == 0) {
        switch (*o->pc >> 24) {
        case 0x30:
            func_02024368((Obj *)o);
            o->pc++;
            break;
        case 0x31:
            index = func_020224c0((char *)o, (*o->pc >> 20) & 15, (unsigned short)*o->pc);
            v.x = func_020224c0((char *)o, (*o->pc >> 16) & 15, (unsigned short)o->pc[1]);
            v.y = func_020224c0((char *)o, (*o->pc >> 16) & 15, (unsigned short)(o->pc[1] >> 16));
            v.z = func_020224c0((char *)o, (*o->pc >> 16) & 15, (unsigned short)o->pc[2]);
            func_0208c04c(&v.x, &v.x);
            o->slots[index].v = v;
            o->pc += 3;
            break;
        case 0x32:
            index = func_020224c0((char *)o, (*o->pc >> 20) & 15, (unsigned short)*o->pc);
            red = func_020224c0((char *)o, (*o->pc >> 16) & 15, (unsigned short)o->pc[1]);
            green = func_020224c0((char *)o, (*o->pc >> 16) & 15, (unsigned short)(o->pc[1] >> 16));
            blue = func_020224c0((char *)o, (*o->pc >> 16) & 15, (unsigned short)o->pc[2]);
            o->slots[index].color = red | (green << 5) | (blue << 10);
            o->pc += 3;
            break;
        }
        if (o->pc != start) o->ticks = 0;
    }
    o->ticks++;
    return 1;
}
