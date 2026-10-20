struct Flags { unsigned int bits:8; unsigned int rest:24; };
typedef struct { unsigned int start, end; } Range;
typedef struct { unsigned short tag; unsigned short info; unsigned int size, f8, fc; } Hdr;
typedef struct { unsigned short tag; unsigned short group:8; unsigned short pad:7; unsigned short used:1; unsigned int size, f8, fc; } Block;
extern void func_0207da1c(Range *out, Hdr *p);
extern char *func_0207d994(int *a0, int a1);
extern int *func_0207d9c4(int *a0, int *n, int *a2);
extern int func_0207d9f4(int *o, int *n);
/* Fill32 is an assembly routine using r0-r2 despite its void source signature. */
extern void Fill32(unsigned int value, void *dest, unsigned int size);
unsigned int func_0207d78c(int *h, int *n, unsigned int addr, unsigned int size, unsigned short flag) {
    Range left, right, used;
    int *prev;
    unsigned int base;
    Hdr *b;
    unsigned int count;
    unsigned int pad, group;
    func_0207da1c(&left, (Hdr *)n);
    base = addr - 0x10;
    right.end = left.end;
    left.end = base;
    right.start = size + addr;
    prev = (int *)func_0207d9f4(h, n);
    if (left.end - left.start < 0x10) left.end = left.start;
    else prev = func_0207d9c4(h, (int *)func_0207d994((int *)&left, 0x4652), prev);
    if (right.end - right.start < 0x10) right.start = right.end;
    else func_0207d9c4(h, (int *)func_0207d994((int *)&right, 0x4652), prev);
    count = right.start - left.end;
    if ((unsigned short)((unsigned int)h[-1] & 0xff) & 1) Fill32(0, (void *)left.end, count);
    used.start = base;
    used.end = right.start;
    b = (Hdr *)func_0207d994((int *)&used, 0x5544);
    b->info &= ~0x8000;
    b->info |= (flag & 1) << 15;
    pad = (unsigned short)((unsigned int)b - left.end);
    b->info &= ~0x7f00;
    b->info |= (pad & 0x7f) << 8;
    group = *(unsigned short *)(h + 4);
    b->info &= ~0xff;
    group = (unsigned char)group;
    b->info |= group;
    func_0207d9c4(h + 2, (int *)b, (int *)h[3]);
    return addr;
}







