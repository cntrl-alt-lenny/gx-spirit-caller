typedef struct { int key; int val; int pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } LookupObj;
typedef struct {
    unsigned short b0:1;
    unsigned short b1:1;
    unsigned short b2:1;
    unsigned short b3:1;
    unsigned short b4:1;
    unsigned short rest:3;
    unsigned short b8:1;
    unsigned short hi:7;
} Flags;
typedef struct {
    char pad[0xac];
    int x, y, z;
    char padb8[12];
    int sx, sy, sz;
    int d0;
    char padd4[8];
    int dx, dy, dz;
    char pade8[0x7e];
    short index;
    short pad168;
    Flags flags;
} Obj02025880;
extern char *func_0202162c(void);
extern int func_02021660(LookupObj *o, int key, int idx);
extern int func_02025880(Obj02025880 *arg0);
extern int func_02025a80(Obj02025880 *o);
extern int func_020265e4(Obj02025880 *o);
int func_02025678(Obj02025880 *o) {
    int draw;
    int index;
    if (o->flags.b0) {
        *(volatile int *)0x04000440 = 2;
        if (!o->flags.b4) {
            o->x <<= 4; o->y <<= 4; o->z <<= 4;
            o->dx <<= 4; o->dy <<= 4; o->dz <<= 4;
            o->sx <<= 4; o->sy <<= 4; o->sz <<= 4;
        }
        if (o->flags.b2) {
            if (o->flags.b1 && o->d0 != 0) {
                draw = 1;
                if (o->flags.b8) {
                    index = o->index;
                    if (index < 0) {
                        draw = func_02025880(o) == 0;
                    } else {
                        draw = func_02025880((Obj02025880 *)func_02021660((LookupObj *)func_0202162c(), 3, index)) == 0;
                    }
                }
                if (draw) func_02025a80(o);
            }
        } else {
            func_020265e4(o);
        }
        if (!o->flags.b4) {
            o->x >>= 4; o->y >>= 4; o->z >>= 4;
            o->dx >>= 4; o->dy >>= 4; o->dz >>= 4;
            o->sx >>= 4; o->sy >>= 4; o->sz >>= 4;
        }
    }
    return 1;
}
