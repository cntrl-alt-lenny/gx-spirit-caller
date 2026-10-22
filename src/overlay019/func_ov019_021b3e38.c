typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { u8 pad[0x2c]; void *data; } Object;
typedef struct { u8 pad[0x448]; Object *objects[29]; int active; } Context;
typedef struct { u16 x, y, pad, h, w; } Params;
extern void func_0201e7ec(void *p, int value);
/* Original caller supplies a second argument omitted by the existing C thunk. */
extern void func_0201e800(void *p, u16 value);
extern int func_0207fd28(void *p, int unused1);
extern void *func_0201e964(int, void *, int *, int, int, int, int, int, int, int, int, int);
void func_ov019_021b3e38(Context *ctx, int index, int value, Params *p) {
    Object *obj;
    int pos[2];
    if (ctx->active == 0) return;
    obj = ctx->objects[index];
    pos[0] = p->x << 12;
    pos[1] = p->y << 12;
    if (value != -1) func_0201e800(obj, (u16)value);
    func_0201e964(2, obj->data, pos, 0, 0, 0, p->w, p->h, 0, 0, 0, 0);
    if (value != -1) return;
    func_0201e7ec(obj, 1);
    func_0207fd28(obj, 0x1000);
}

