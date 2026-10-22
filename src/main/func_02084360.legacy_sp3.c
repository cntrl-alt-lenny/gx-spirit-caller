typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Obj {
    u8 *pc;
    int pad4;
    u32 flags;
    char padc[0xa1];
    u8 id;
    char padae[0x2a];
    u8 *data;
} Obj;
extern struct { int header; void (*handlers[1])(Obj *, int, u8 *, int); } data_021021ec;
void func_02084360(Obj *o, int arg)
{
    u32 flags = o->flags;
    if (!(flags & 0x200)) {
        int id = o->pc[1];
        if ((flags & 1) || !(flags & 8) || id != o->id) {
            u8 *data = o->data;
            u8 *base = data + 4;
            u32 off = *(u16 *)(data + 0xa);
            u8 *entry = base + off;
            u32 stride = *(u16 *)entry;
            u32 target = *(u32 *)(entry + stride * id + 4);
            u8 *p = data + target;
            data_021021ec.handlers[*(u16 *)p](o, arg, p, id);
        }
    }
    o->pc += 2;
}

