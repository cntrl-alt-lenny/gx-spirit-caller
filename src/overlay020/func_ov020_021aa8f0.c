typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 a, b, flags, d; } Entry;
extern u32 func_0207ec28(void *);
extern u32 func_0207f934(Entry *, u32, void *, int, int, int, int);
u32 func_ov020_021aa8f0(void *a, Entry **out, void *c, int d, int priority, int palette) {
    u32 n = func_0207f934(*out, (u16)func_0207ec28(a), c, 0, d, 0, 0);
    if (n != 0) {
        Entry *p = *out;
        u32 i;
        if (priority >= 0 && priority != ((p->flags & 0xc00) >> 10)) {
            for (i = 0; i < n; i++, p++) {
                p->flags = (p->flags & ~0xc00) | (priority << 10);
            }
        }
        p = *out;
        if (palette >= 0 && palette != ((p->flags & 0xf000) >> 12)) {
            for (i = 0; i < n; i++, p++) {
                p->flags &= ~0xf000;
                p->flags |= palette << 12;
            }
        }
    }
    *out += n;
    return n;
}
