typedef struct {
    char pad[0x10];
    unsigned char *p1;
    int n1;
    unsigned char *p2;
    int n2;
} ring_0206d360_t;
typedef struct Container { void *head; void *f04; } Container;
extern int func_0206d360(unsigned char *dst, int len, ring_0206d360_t *rb);
extern int func_0206d404(int size);
extern unsigned int func_02070430(int a, int b);
extern void func_02070f78(int a0, int a1, int a2);
extern void func_02091a0c(Container *c);

int func_0206d4c0(ring_0206d360_t *rb) {
    char *obj = *(char **)((char *)rb + 4);
    char *base;
    unsigned char *buffer;
    int total = 0;
    int length;
    int offset;
    int count;
    int sent;
    int special;
    base = *(char **)(obj + 0x68);
    special = (*(signed char *)(obj + 0x73) == 0 || *(signed char *)(obj + 0x73) == 4);
    if (!special || (*(short *)(obj + 0x70) & 4)) {
        if (*(int *)((char *)rb + 0x28) != 0) {
            func_02070f78(*(unsigned short *)((char *)rb + 0x24), *(unsigned short *)((char *)rb + 0x26), *(int *)((char *)rb + 0x28));
        }
        offset = (*(signed char *)(obj + 0x73) == 0 || *(signed char *)(obj + 0x73) == 4) ? 0x36 : 0x2a;
        buffer = *(unsigned char **)(obj + 0x4c) + offset;
        if (*(signed char *)(obj + 0x73) == 0 || *(signed char *)(obj + 0x73) == 4) {
            length = func_0206d404(*(int *)(obj + 0x48) - offset);
        } else {
            length = *(int *)(obj + 0x48) - offset;
        }
        for (;;) {
            count = func_0206d360(buffer, length, rb);
            if (count <= 0) break;
            sent = (int)func_02070430((int)buffer, count);
            if (sent <= 0) {
                special = (*(signed char *)(obj + 0x73) == 0 || *(signed char *)(obj + 0x73) == 4);
                if (special) {
                    *(short *)(obj + 0x70) &= ~0xe;
                }
                total = -76;
                break;
            }
            total += sent;
        }
    } else {
        total = -76;
    }
    *(unsigned short *)(base + 0x102) = *(unsigned short *)((char *)rb + 0x20);
    func_02091a0c((Container *)(base + 0x104));
    return total;
}






