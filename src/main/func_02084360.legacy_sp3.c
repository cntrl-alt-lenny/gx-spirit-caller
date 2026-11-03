typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Obj Obj;
typedef struct Input { u32 pad0,a,b,c,mask,d; u16 pad18[2]; u16 e,flags,q,r; u32 s,t; } Input;
struct Obj { u8 *pc; int pad4; u32 flags; char padc[0xa1]; u8 id; char padae[0x2a]; u8 *res; };
extern struct { u32 header; void (*handlers[4])(Obj *, int, Input *, u32); } data_021021ec;
void func_02084360(Obj *o, int mode)
{
    if (!(o->flags & 0x200)) {
        u32 id = o->pc[1];
        if ((o->flags & 1) || !(o->flags & 8) || id != o->id) {
            u8 *res = o->res;
            u8 *table = res + 4;
            u32 offset = *(u16 *)(res + 0xa);
            u8 *entry = table + offset;
            Input *in = (Input *)(res + *(u32 *)(entry + *(u16 *)entry * id + 4));
            data_021021ec.handlers[*(u16 *)in](o, mode, in, id);
        }
    }
    o->pc += 2;
}
