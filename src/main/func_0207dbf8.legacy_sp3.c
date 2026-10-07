/* func_0207dbf8: carve size bytes off the bottom of the arena (lo moves up,
 * result aligned up to align); clear them first when the arena's flag bit
 * (word at -4) asks for it; 0 when it would cross hi. */
typedef struct {
    unsigned int lo;
    unsigned int hi;
} Arena;
extern void Fill32(int value, unsigned int dest, unsigned int size);

unsigned int func_0207dbf8(Arena *a, unsigned int size, unsigned int align) {
    unsigned int bottom = a->lo;
    unsigned int p = ~(align - 1) & ((align - 1) + bottom);
    unsigned int end = size + p;
    unsigned int n;

    if (end > a->hi) {
        return 0;
    }
    n = end - bottom;
    if ((unsigned short)(((unsigned int *)a)[-1] & 0xff) & 1) {
        Fill32(0, bottom, n);
    }
    a->lo = end;
    return p;
}
