typedef unsigned int u32;
typedef unsigned short u16;
typedef struct {
    char pad[0x1914];
    u32 mode, size, capacity, middle, end;
    char pad1928[8];
    u32 arg, flags, source, length;
} State;
typedef struct { char pad[0x914]; u32 mode; } StateAlias;
extern State data_0218cbc8;
extern StateAlias data_0218dbc8;
extern void func_0208d4f0(u16 v);
extern void func_0208d3fc(u16 v);
/* Fill32's assembly definition has a placeholder void signature; callers pass three arguments. */
extern void Fill32(u32 value, void *dest, u32 size);
int func_0200f854(u16 a, u16 b, u32 size, u32 source, u32 arg)
{
    State *s = &data_0218cbc8;
    func_0208d4f0(a);
    func_0208d3fc(b);
    Fill32(0, s, 0x3148);
    data_0218dbc8.mode = 1;
    switch (a) {
    case 0: s->capacity = 0; break;
    case 1: case 2: case 4: case 8: s->capacity = 0x20000; break;
    case 3: case 5: case 6: case 9: case 10: case 12: s->capacity = 0x40000; break;
    case 7: case 11: case 13: case 14: s->capacity = 0x60000; break;
    case 15: s->capacity = 0x80000; break;
    }
    switch (b) {
    case 0: s->flags = 0; break;
    case 0x20: case 0x40: s->flags = 0x4000; break;
    case 0x60: s->flags = 0x8000; break;
    case 0x10: s->flags = 0x10000; break;
    case 0x30: s->flags = 0x14000; break;
    case 0x70: s->flags = 0x18000; break;
    }
    s->arg = arg;
    if (size != 0) {
        if (s->capacity < 0x40000) return 0;
        s->mode = 2;
        if (s->capacity == 0x40000) {
            s->source = source;
            s->length = size;
            s->size = size;
            s->capacity = 0x20000;
            s->middle = 0x20000 + (size >> 1);
            s->end = 0x40000;
        } else if (s->capacity == 0x60000 || s->capacity == 0x80000) {
            u32 end = 0x60000;
            if (s->capacity == 0x80000) end = 0x80000;
            s->source = source;
            s->length = size;
            s->size = size;
            s->capacity = 0x20000;
            s->middle = 0x20000 + (size >> 1);
            s->end = end;
        } else return 0;
    }
    return 1;
}
