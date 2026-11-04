typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    int index;
    u16 start, end; volatile u16 saved;
} State;
typedef struct {
    u16 x, y, z, pad;
} Entry;
typedef unsigned char Bank[0x540];
extern Bank data_021a08f4[];
static inline u16 capacity(State *s) {
    int valid;
    int end = s->end;
    u16 saved = s->saved;
    u16 count;
    valid = 0;
    if (saved <= end + 1) {
        if (s->start <= (u32)end) valid = 1;
    }
    if (valid) count = end - saved + 1;
    else count = 0;
    return count;
}
static inline u32 has_space(State *s, u32 needed) {
    return capacity(s) >= needed ? 1u : 0u;
}
int func_0207f05c(State *s, Entry *values, int count) {
    if (has_space(s, count)) {
        int i;
        u32 base = s->index;
Entry *dest;
        base *= 0x540;
        base += (u32)data_021a08f4;
        dest = (Entry *)(base + 0x100) + s->saved;
        for (i = 0; i < count; i++) {
            dest[i].x = values->x;
            dest[i].y = values->y;
            dest[i].z = values->z;
            values++;
            s->saved++;
        }
        return 1;
    }
    return 0;
}




