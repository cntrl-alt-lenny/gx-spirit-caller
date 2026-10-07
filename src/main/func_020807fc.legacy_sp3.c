typedef unsigned short u16;
typedef unsigned int u32;
typedef signed char s8;
typedef unsigned char u8;

typedef struct Sub { u16 pad0; u16 stride; u32 pad1[1]; char data[1]; } Sub;
typedef struct Tab { u16 pad0; u16 first; int pad1; Sub *sub; } Tab;
typedef struct Obj { Tab *tab; int pad; u16 flag; } Obj;
typedef struct Host { int pad[5]; void (*fn)(); } Host;
typedef struct Out { s8 *p; char *q; } Out;

extern u16 func_02080114(Obj *o, u16 key);
extern s8 *func_020800b8(Obj *o, u16 idx);

int func_020807fc(Host *h, Obj *o, int x, int a3, int a4, u16 key)
{
    Out out;
    u16 idx = func_02080114(o, key);
    if (idx == 0xffff) {
        idx = o->tab->first;
    }
    out.p = func_020800b8(o, idx);
    out.q = o->tab->sub->data + idx * o->tab->sub->stride;
    h->fn(h, o, x + out.p[0], a3, a4, &out);
    if (o->flag != 0) {
        return out.p[0] + (u8)out.p[1];
    }
    return out.p[2];
}
