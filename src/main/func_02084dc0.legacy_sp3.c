typedef unsigned char u8;
typedef struct Ctx Ctx;
struct Ctx {
    u8 *pc;
    int pad4;
    unsigned int flags;
};
extern void (*data_021022e0[])(Ctx *, int);

void func_02084dc0(Ctx *c)
{
    do {
        int op;
        c->flags &= ~0x40;
        op = *c->pc;
        data_021022e0[op & 0x1f](c, op & 0xe0);
    } while (!(c->flags & 0x20));
}
