typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
} Rect;
extern int func_ov019_021b2728(Rect *r);

int func_ov019_021b4324(char *a0) {
    struct {
        Rect rect;
        unsigned short a;
        unsigned short b;
    } box;
    unsigned int i;
    box.rect.x = 6;
    box.rect.w = 0xda;
    box.rect.h = 0x10;
    box.a = 0;
    box.b = 0;
    for (i = 0; (int)i < (*(int *)(a0 + 8) > 6 ? 6 : *(int *)(a0 + 8)); i++) {
        box.rect.y = 12 + i * 24;
        if (func_ov019_021b2728(&box.rect) != 0)
            return i;
    }
    return -1;
}


