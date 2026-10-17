/* func_0207da1c: describe the heap block at p: out->start = p - pad (the pad
 * is a 7-bit field of the halfword at +2), out->end = p + 0x10 + size. */
typedef struct {
    unsigned int start;
    unsigned int end;
} Range;
typedef struct {
    unsigned short tag;
    unsigned short info;
    unsigned int size;
    unsigned int f8;
    unsigned int fc;
} Hdr;

void func_0207da1c(Range *out, Hdr *p) {
    unsigned short pad = (p->info >> 8) & 0x7f;
    out->start = (unsigned int)p - pad;
    out->end = p->size + (unsigned int)(p + 1);
}
