typedef unsigned int u32;
typedef unsigned char u8;
typedef struct { u32 x,y,z; } Vec;
typedef struct { u32 flags; Vec a,b; } Dst;
typedef struct { Vec a,b; } Src;
typedef struct { u8 pad[0xc4]; u32 bits[8]; } State;
typedef struct { u32 v; u32 pad[5]; } Slot;
extern State *data_021a1b1c;
extern Slot data_021a292c[], data_021a2930[], data_021a2934[];
void func_02085d24(Dst *d, Src *s, u8 *p, u32 flags)
{
    u32 f = p[3];
    if (flags & 4) {
        d->flags |= 1;
        if (f & 2) {
            u32 n = p[1];
            data_021a1b1c->bits[n >> 5] |= 1U << (n & 31);
        }
    } else {
        d->a.x = s->a.x;
        d->a.y = s->a.y;
        d->a.z = s->a.z;
        if (f & 2) {
            u32 n = p[1];
            data_021a1b1c->bits[n >> 5] &= ~(1U << (n & 31));
            data_021a292c[n].v = s->b.x;
            data_021a2930[n].v = s->b.y;
            data_021a2934[n].v = s->b.z;
        }
    }
    if (f & 1) {
        u32 n = p[2];
        d->flags |= 0x20;
        if (data_021a1b1c->bits[n >> 5] & (1U << (n & 31))) {
            d->flags |= 8;
        } else {
            d->b = *(Vec *)&data_021a292c[n];
        }
    }
    d->flags |= 0x10;
}
