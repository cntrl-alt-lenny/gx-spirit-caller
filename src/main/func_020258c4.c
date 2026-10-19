typedef struct { int w[26]; } Header;
typedef struct { int w[11]; } Config;
typedef struct { int x,y,z; } Vec;
typedef struct { short id; unsigned char b2, flags; char pad[12]; } Slot;
typedef struct {
    unsigned short low:3;
    unsigned short b34:2;
    unsigned short b5:1;
    unsigned short b611:6;
    unsigned short high:4;
} Flags;
typedef struct {
    Header head;
    Config cfg;
    char pad94[24];
    Vec pos, rot, scale;
    int d0,d4,d8;
    char paddc[36];
    Slot slots[6];
    unsigned short h160,h162,h164,h166,h168;
    unsigned short flags;
} Obj;
extern void Fill32(int value, void *dst, int size);
extern int func_02025f00(Obj *o);
int func_020258c4(Obj *o, Config *c) {
    Header saved;
    int i;
    unsigned char *fp;
    saved = o->head;
    Fill32(0, o, 0x16c);
    o->head = saved;
    o->cfg = *c;
    o->pos = *(Vec *)((char *)c + 0x1c);
    o->rot.x = 0;
    o->rot.y = 0;
    o->rot.z = 0;
    o->scale.x = 0x1000;
    o->scale.y = 0x1000;
    o->scale.z = 0x1000;
    o->d0 = 0x1f0;
    o->d4 = 0;
    o->d8 = 0;
    o->h162 = 2;
    o->h164 = 0;
    o->flags = ((o->flags | 6) & ~1) | 1;
    o->flags &= ~0x20;
    o->flags = (o->flags & ~0xf000) | 0xf000;
    fp = (unsigned char *)o + 0x103;
    for (i=0; i<6; i++, fp+=16) {
        o->slots[i].id = -1;
        *fp &= ~1;
    }
    func_02025f00(o);
    return 1;
}



