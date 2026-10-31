typedef unsigned int u32;
typedef struct { u32 start; unsigned char *source; unsigned char *dest; u32 size; } Region;
extern void func_020945f4(void *dest, int value, u32 size);
extern void func_02094688(const void *source, void *dest, u32 size);
void func_020a26f0(Region *p, u32 start, u32 end, int clear) {
    u32 base = p->start;
    u32 size = p->size;
    if (start < 0x4000) start = 0x4000;
    if (end > 0x8000) end = 0x8000;
    if (start < base) start = base;
    if (end > base + size) end = base + size;
    if (start >= end) return;
    if (clear) {
        func_020945f4(p->dest + start, 0, end - start);
    } else {
        func_02094688(p->source + start, p->dest + start, end - start);
    }
}
