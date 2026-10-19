extern int func_0207f934(void *dst, unsigned short count, void *cell, void *matrix, int *position, int attr, int flag);

int func_ov010_021b2280(void *arg0, int index, int cell, char **dst, int *remaining) {
    char *p = arg0;
    int position[2];
    int count;
    if (index < 5) {
        position[0] = *(short *)(p + 0x34 + index * 8) << 12;
        position[1] = *(short *)(p + 0x36 + index * 8) << 12;
    } else {
        position[0] = *(short *)(p + 0x34) << 12;
        position[1] = (*(short *)(p + 0x36) + *(int *)(p + 4)) << 12;
    }
    if (*(int *)(p + 0x8c + index * 4) == 1) cell++;
    count = func_0207f934(*dst, (unsigned short)*remaining, *(void **)(p + 0x74 + cell * 4), 0, position, 0, 0);
    *dst += count * 8;
    *remaining -= count;
    return count;
}

