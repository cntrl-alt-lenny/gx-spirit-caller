typedef struct {
    char _pad0[0x4];
    unsigned short f4;
    char _pad1[0x18 - 0x6];
    unsigned short f18;
    char _pad2[0x32 - 0x1a];
    unsigned short f32;
} obj_t;

int func_0209ee90(obj_t *p) {
    if (p->f4 > 0x70) {
        return 0;
    }
    if (p->f18 < 0xa || p->f18 > 0x3e8) {
        return 0;
    }
    if (p->f32 < 1 || p->f32 > 0xe) {
        return 0;
    }
    return 1;
}
