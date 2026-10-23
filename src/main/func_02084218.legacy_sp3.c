typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Ctx Ctx;
typedef struct Arg { char pad[8]; int off; int len; } Arg;
struct Ctx { u8 *pc; int pad4; u32 flags; char padc[0xd0]; u8 *res; };
extern void (*data_02102200[])(Ctx *, int, Arg *, u32);
void func_02084218(Ctx *c, int unused)
{
    if (!(c->flags & 0x200) && (c->flags & 1) && !(c->flags & 2)) {
        u8 *res = c->res;
        u32 index = c->pc[1];
        u8 *entry = res + *(u16 *)(res + 6);
        Arg *arg = (Arg *)(res + *(u32 *)(entry + *(u16 *)entry * index + 4));
        data_02102200[*(u16 *)arg](c, unused, arg, index);
    }
    c->pc += 2;
}


