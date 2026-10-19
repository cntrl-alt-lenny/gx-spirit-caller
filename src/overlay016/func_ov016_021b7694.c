typedef struct {
    unsigned short x, y;
    unsigned char width, height;
} Ov016Rect;
extern int func_ov016_021b287c(Ov016Rect *rect);
int func_ov016_021b7694(void *arg) {
    unsigned short box[5];
    unsigned int i;
    box[0] = 6;
    ((unsigned char *)box)[4] = 0xda;
    ((unsigned char *)box)[5] = 0x10;
    box[3] = 0;
    box[4] = 0;
    for (i = 0; (int)i < (*(int *)((char *)arg + 8) > 6 ? 6 : *(int *)((char *)arg + 8)); i++) {
        box[1] = i * 24 + 12;
        if (func_ov016_021b287c((Ov016Rect *)box)) return i;
    }
    return -1;
}


