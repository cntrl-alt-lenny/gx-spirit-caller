typedef unsigned char u8;
typedef unsigned int u32;
typedef struct Ctx Ctx;
struct Header {
    u32 pad0;
    u32 code;
    u32 table1;
    u32 table2;
    u8 pad10[5];
    u8 type;
    u8 type2;
    u8 pad17[5];
    u32 value1;
    u32 value2;
};
struct Params {
    u32 flags;
    struct Header *header;
    u8 pad8[0x18];
    void *entry;
    u8 index;
    u8 kind;
    u8 pad26[2];
    void (*callback)(Ctx *);
    u32 pad2c;
    u8 *code;
};
struct Ctx {
    u8 *pc;
    struct Params *params;
    u32 flags;
    void *entries[32];
    u8 kinds[32];
    u8 padac[0x18];
    u32 active;
    u8 padc8[0xc];
    void *data;
    void *table1;
    void *table2;
    u32 value1;
    u32 value2;
    u32 a;
    u32 b;
    u32 c;
};
extern u32 data_021021c4[];
extern u32 data_021021b8[];
extern u32 data_021021d0[];
extern void func_02094504(u32 value, void *dest, u32 size);
extern void func_02084dc0(Ctx *c);
void func_02084c38(Ctx *c, struct Params *p)
{
    func_02094504(0, c, 0x188);
    c->active = 1;
    c->flags = 1;
    if (p->code != 0) c->pc = p->code;
    else c->pc = (u8 *)p->header + p->header->code;
    c->params = p;
    c->data = (u8 *)p->header + 0x40;
    c->table1 = (u8 *)p->header + p->header->table1;
    c->table2 = (u8 *)p->header + p->header->table2;
    c->a = data_021021c4[p->header->type];
    c->b = data_021021b8[p->header->type];
    c->c = data_021021d0[p->header->type2];
    c->value1 = p->header->value1;
    c->value2 = p->header->value2;
    if (p->entry != 0 && p->index < 32) {
        c->entries[p->index] = p->entry;
        c->kinds[p->index] = p->kind;
    }
    if (p->flags & 1) c->flags |= 0x80;
    if (p->flags & 2) c->flags |= 0x100;
    if (p->flags & 4) c->flags |= 0x200;
    if (p->flags & 8) c->flags |= 0x400;
    if (p->callback != 0) p->callback(c);
    func_02084dc0(c);
    p->flags &= ~1;
}
