typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Ctx Ctx;
struct Ctx { u8 *pc; int pad4; u32 flags; char padc[0xa1]; u8 id; char padae[0x2a]; u8 *res; };
extern void (*data_021021ec[])(Ctx *, int, u8 *, u32);
void func_02084360(Ctx *c, int unused)
{
    if (!(c->flags & 0x200)) {
        u32 index = c->pc[1];
        if ((c->flags & 1) || !(c->flags & 8) || index != c->id) {
            u8 *res = c->res;
            u8 *table = res + 4;
            u8 *entry = table + *(u16 *)(res + 0xa);
            u8 *arg = res + *(u32 *)(entry + *(u16 *)entry * index + 4);
            (data_021021ec + 1)[*(u16 *)arg](c, unused, arg, index);
        }
    }
    c->pc += 2;
}

