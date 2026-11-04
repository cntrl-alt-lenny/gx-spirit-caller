typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    int index;
    u16 first, last, previous, start, end;
    volatile u16 saved;
    int pad10;
    int active;
} State;
typedef unsigned char Bank[0x540];
extern Bank data_021a08f4[];
static inline u16 capacity(State *s) {
    int valid;
    int end = s->end;
    u16 saved = s->saved;
    valid = 0;
    u16 count;
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
int func_0207ef90(State *s, int *values) {
    if (has_space(s, 1) == 0) return 0xfffe;
    {
        u32 base = s->index;
        u16 index;
        u16 *ptr;
        base *= 0x540;
        base += (u32)data_021a08f4;
        index = s->saved;
        base += 0x100;
        ptr = (u16 *)(base + index * 32);
        ptr[3] = values[0] >> 4;
        ptr[7] = values[1] >> 4;
        ptr[11] = values[2] >> 4;
        ptr[15] = values[3] >> 4;
        s->saved++;
        return index;
    }
}











