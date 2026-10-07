typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

struct Pack { char pad0[8]; u8 pad8; u8 count; char pad1[4]; u16 off; };

extern int func_02081d18(void *p, void *ctx);
extern int func_02081bd8(void *p, void *ctx);

int func_02081b5c(struct Pack *a, void *ctx)
{
    u32 i;
    int ok = 1;
    for (i = 0; i < a->count; i++) {
        u16 off = a->off;
        u16 stride = *(u16 *)((char *)a + 8 + off);
        char *e = (char *)a + 8 + off + stride * i;
        void *p = (char *)a + *(u32 *)(e + 4);
        ok &= func_02081d18(p, ctx);
        ok &= func_02081bd8(p, ctx);
    }
    return ok;
}
