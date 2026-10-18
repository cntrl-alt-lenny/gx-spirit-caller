typedef struct {
    unsigned short x, y;
    unsigned char width, height;
} Ov016Rect;
extern void func_02006110(int *x, int *y);
extern void *func_020061ac(void);
int func_ov016_021b287c(Ov016Rect *rect) {
    int x, y;
    func_02006110(&x, &y);
    if (func_020061ac() != 0) {
        if (rect->x <= x && rect->x + rect->width > x &&
            rect->y <= y && rect->y + rect->height > y) {
            return 1;
        }
    }
    return 0;
}

