typedef struct Rect { short left, top, right, bottom; } Rect;
static inline void setRect(Rect *r, short left, short top, short right, short bottom) {
    r->left = left;
    r->top = top;
    r->right = right;
    r->bottom = bottom;
}
void func_ov010_021b2514(void *arg0, int mode, int x, int y) {
    char *p = arg0;
    switch (mode) {
    case 0:
        setRect((Rect *)(p + 0x3c), x, y, x + 0x18, y + 0x14);
        break;
    case 1:
        setRect((Rect *)(p + 0x44), x, y, x + 0x18, y + 0x14);
        break;
    case 2: {
        int bottom, right, top, left;
        bottom = *(short *)(p + 0x46);
        top = *(short *)(p + 0x42);
        right = *(short *)(p + 0x48);
        x = *(short *)(p + 0x3c);
        y = bottom + 4;
        *(short *)(p + 0x34) = x;
        *(short *)(p + 0x36) = top;
        *(short *)(p + 0x38) = right;
        *(short *)(p + 0x3a) = y;
        left = *(short *)(p + 0x3c);
        top = *(short *)(p + 0x42);
        *(short *)(p + 0x4c) = left;
        *(short *)(p + 0x4e) = top;
        *(short *)(p + 0x50) = left + 0x18;
        *(short *)(p + 0x52) = top + 0x15;
        left = *(short *)(p + 0x44);
        y = *(short *)(p + 0x46);
        *(short *)(p + 0x54) = left;
        *(short *)(p + 0x56) = y - 0x11;
        *(short *)(p + 0x58) = left + 0x18;
        *(short *)(p + 0x5a) = y + 4;
        *(int *)(p + 4) = 0;
        *(int *)(p + 8) = *(short *)(p + 0x56) - *(short *)(p + 0x4e);
        *(int *)(p + 0x10) = *(short *)(p + 0x4e);
        break;
    }
    }
}







