/* func_0207db8c: carve size bytes off the top of the arena (hi moves down,
 * result aligned down to align); clear them first when the arena's flag bit
 * (word at -4) asks for it; 0 when it would cross lo. */
typedef struct {
    unsigned int lo;
    unsigned int hi;
} Arena;
extern void Fill32(int value, unsigned int dest, unsigned int size);

unsigned int func_0207db8c(Arena *a, unsigned int size, unsigned int align) {
    unsigned int top = a->hi;
    unsigned int p = ~(align - 1) & (top - size);

    unsigned int n;

    if (p < a->lo) {
        return 0;
    }
    n = top - p;
    if ((unsigned short)(((unsigned int *)a)[-1] & 0xff) & 1) {
        Fill32(0, p, n);
    }
    a->hi = p;
    return p;
}
