typedef unsigned int u32;
typedef struct {
    volatile u32 start, end;
    int enabled;
    u32 unused;
    unsigned short kind, pad;
    u32 offset;
} Slot;
extern Slot *data_02102104[2];
extern Slot *data_0210210c[5];
extern Slot data_02102138;
extern Slot data_02102150;

static inline int front(u32 size, u32 *address)
{
    int i;
    Slot *s;
    Slot *other;
    u32 half = size >> 1;
    for (i = 0; i < 2; i++) {
        s = data_02102104[i];
        if (s->enabled == 0) continue;
        if (s->end - s->start < size) continue;
        switch (s->kind) {
        case 0: other = &data_02102138; break;
        case 3: other = &data_02102150; break;
        default: other = 0; break;
        }
        if (other->enabled == 0) continue;
        if (other->end - other->start < half) continue;
        {
            u32 start = s->start;
            s->start = start + size;
            other->start += half;
            *address = start + s->offset;
        }
        return 1;
    }
    return 0;
}
static inline int back(u32 size, u32 *address)
{
    int i;
    for (i = 0; i < 5; i++) {
        Slot *s = data_0210210c[i];
        if (s->enabled == 0) continue;
        if (s->end - s->start < size) continue;
        s->end -= size;
        *address = s->end + s->offset;
        return 1;
    }
    return 0;
}
u32 func_0207df20(u32 size, u32 mode)
{
    u32 address;
    u32 aligned;
    int found;
    if (size == 0) aligned = 16;
    else aligned = (size + 15) & ~15;
    if (aligned >= 0x7fff0) return 0;
    if (mode != 0) found = front(aligned, &address);
    else found = back(aligned, &address);
    if (found != 0) {
        return ((address >> 3) & 0xffff) | ((aligned >> 4) << 16) | (mode << 31);
    }
    return 0;
}


