typedef struct {
    char pad[0x14];
    unsigned short width, height;
    char *buffers[3];
} Obj;
/* Fill32's assembly definition uses r0-r2 despite its void parameter list. */
extern void Fill32(int value, void *dest, int size);
void func_ov005_021abcc4(Obj *p, int idx, int start, int count) {
    int row = (start >> 3) * 32 * p->width;
    char *dest;
    int i;
    int size;
    int offset = start & 7;

    dest = p->buffers[idx] + (row + offset * 4);
    if (offset) {
        i = 0;
        if (i < p->width) {
            size = (8 - offset) * 4;
            do {
                Fill32(0, dest, size);
                i++;
                dest += 32;
            } while (i < p->width);
        }
        count -= 8 - offset;
    }
    i = count / 8;
    if (i > 0) {
        dest -= offset * 4;
        Fill32(0, dest, p->width * (i * 32));
        count -= i * 8;
        dest += p->width * (i * 32);
    }
    if (count > 0) {
        for (i = 0; i < p->width; i++) {
            Fill32(0, dest, count * 4);
            dest += 32;
        }
    }
}





