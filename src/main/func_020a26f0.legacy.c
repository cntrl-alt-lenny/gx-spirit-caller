typedef unsigned int u32;
typedef struct { u32 start; unsigned char *src; unsigned char *dst; u32 size; } Range;
extern void func_020945f4(void *, int, u32);
extern void func_02094688(const void *, void *, u32);
void func_020a26f0(Range *p, u32 start, u32 end, int clear) {
    u32 lo = p->start;
    u32 size = p->size;
    u32 hi;
    if (start < 0x4000) start = 0x4000;
    if (end > 0x8000) end = 0x8000;
    hi = lo + size;
    if (start < lo) start = lo;
    if (end > hi) end = hi;
    if (start >= end) return;
    if (clear) {
        func_020945f4(p->dst + start, 0, end - start);
    } else {
        func_02094688(p->src + start, p->dst + start, end - start);
    }
}
