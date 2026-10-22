typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
struct State { char pad0[0x10]; u32 flags; char pad14[0x18]; u16 width, height; };
typedef struct Ctx Ctx;
struct Ctx {
    u8 *pc; int pad4; u32 flags; char padc[0x30];
    void (*cb)(Ctx *); char pad40[0x58]; u8 stage; char pad99[0x17];
    struct State *state; char padb4[0x24]; u8 *resource;
};
extern int data_021021e8[2];
extern int data_021021ec;
extern unsigned char data_021a18b8[];
extern int data_021a1904[];
extern int data_021a1974[];
extern void func_02084e0c(int cmd, void *src, int n);
extern void func_020852fc(void *a0, void *a1);
void func_02082c44(Ctx *c)
{
    int st, skip;
    int a, b, d, e, f;
    int matrix[9];
    int vec[3];
    if (!(c->flags & 0x200) && (c->flags & 1)) {
        if ((c->state->flags & 0xc0000000) != 0x80000000) {
            c->state->flags &= ~0xc0000000;
            c->state->flags |= 0x80000000;
            data_021021e8[1] = c->state->flags;
            func_02084e0c(data_021021e8[0], &data_021021ec, 1);
        }
        a = 3;
        func_02084e0c(0x10, &a, 1);
        if (c->cb != 0) st = c->stage; else st = 0;
        if (st == 1) {
            c->flags &= ~0x40;
            c->cb(c);
            if (c->cb != 0) st = c->stage; else st = 0;
            skip = c->flags & 0x40;
        } else skip = 0;
        if (skip == 0) {
            int width, height;
            height = c->state->height;
            width = c->state->width;
            vec[0] = width << 15;
            vec[1] = -height << 15;
            vec[2] = 0x10000;
            func_02084e0c(0x1b, vec, 3);
            b = (u16)(short)(width << 3) | ((u16)(short)(height << 3) << 16);
            func_02084e0c(0x22, &b, 1);
        }
        if (st == 2) {
            c->flags &= ~0x40;
            c->cb(c);
            if (c->cb != 0) st = c->stage; else st = 0;
            skip = c->flags & 0x40;
        } else skip = 0;
        if (skip == 0) {
            u8 *base = c->resource;
            u8 *table = base + 4;
            u8 *entry = table + *(u16 *)(base + 10);
            u8 *p = base + *(u32 *)(entry + *(u16 *)entry * c->pc[1] + 4);
            int flags = *(u16 *)(p + 0x1e);
            if (flags & 0x2000) {
                p += 0x2c;
                if (!(flags & 2)) p += 8;
                if (!(flags & 4)) p += 4;
                if (!(flags & 8)) p += 8;
                func_02084e0c(0x18, p, 0x10);
            }
        }
        if (st == 3) {
            c->flags &= ~0x40;
            c->cb(c);
            skip = c->flags & 0x40;
        } else skip = 0;
        if (skip == 0) {
            d = 2;
            func_02084e0c(0x10, &d, 1);
            func_020852fc(0, matrix);
            e = 3;
            func_02084e0c(0x10, &e, 1);
            if (*(u32 *)(data_021a18b8 + 0xfc) & 1) {
                func_02084e0c(0x1a, data_021a1904, 9);
                func_02084e0c(0x1a, data_021a1974, 9);
                func_02084e0c(0x1a, matrix, 9);
            } else if (*(u32 *)(data_021a18b8 + 0xfc) & 2) {
                func_02084e0c(0x1a, data_021a1904, 9);
                func_02084e0c(0x1a, matrix, 9);
            } else {
                func_02084e0c(0x1a, matrix, 9);
            }
        }
        f = 2;
        func_02084e0c(0x10, &f, 1);
    }
    c->pc += 3;
}

