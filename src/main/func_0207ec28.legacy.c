typedef unsigned short u16;
typedef unsigned int u32;
typedef struct {
    int index;
    u16 first, last, previous;
} State;
u16 func_0207ec28(State *s) {
    int valid = 0;
    int last = s->last;
    if (s->previous <= last + 1) {
        if (s->first <= (u32)last) valid = 1;
    }
    if (!valid) return 0;
    else return (u16)(last - s->previous + 1);
}
