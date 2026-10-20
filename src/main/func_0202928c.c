typedef unsigned int u32;
typedef struct { u32 words[26]; } Header;
typedef struct { void *name; unsigned char mode; char pad5[3]; int x; int y; int pos[3]; u32 flags; } Arg;
typedef struct { char pad[0x1c]; unsigned int a:8; unsigned int b:8; char tail[8]; } InitObj;
typedef struct { char pad[12]; int w0c; short h10; short pad12; unsigned short kind:4; unsigned short enabled:1; unsigned short rest:11; char tail[18]; } Sub;
typedef struct { Header header; Arg arg; char pad88[8]; Sub sub; char padb8[180]; int pos[3]; char pad178[12]; short h184; char pad186; unsigned char active:1; unsigned char rest187:7; void *w188; short h18c; char pad18e[12]; unsigned short b0:1; unsigned short b1:1; unsigned short b2:1; unsigned short rest19a:13; } Obj;
extern void Fill32(int v, void *dst, unsigned int n);
extern int func_0201d47c(InitObj *o);
extern int func_02029624(Obj *o);
int func_0202928c(Obj *o, Arg *a) {
    Header save = o->header;
    short screen = o->h18c;
    Fill32(0,o,0x19c);
    o->header = save;
    o->h18c = screen;
    o->arg = *a;
    *(struct Pos { int p[3]; } *)o->pos = *(struct Pos *)a->pos;
    o->b1 = 1;
    o->b2 = 1;
    o->b0 = 1;
    o->h184 = -1;
    o->active = 0;
    if (o->h18c == 0) {
        volatile u32 *r = (volatile u32 *)0x04000000;
        u32 planes = (*r & 0x1f00) >> 8;
        *r = (*r & ~0x1f00) | ((planes | 0x10) << 8);
    } else {
        volatile u32 *r = (volatile u32 *)0x04001000;
        u32 planes = (*r & 0x1f00) >> 8;
        *r = (*r & ~0x1f00) | ((planes | 0x10) << 8);
    }
    func_0201d47c((InitObj *)&o->sub);
    o->sub.kind = (unsigned short)(o->h18c == 0 ? 4 : 9);
    o->sub.w0c = (a->flags & 4) ? -1 : a->x;
    o->sub.h10 = (a->flags & 8) ? -1 : (short)a->y;
    o->sub.enabled = (unsigned short)(a->mode == 1 ? 1 : 0);
    func_02029624(o);
    return 1;
}

