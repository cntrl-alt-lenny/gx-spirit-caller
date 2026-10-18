typedef struct {
    unsigned short x, y;
    unsigned char w, h;
} Rect;
extern void func_02006148(int *out_a, int *out_b);
extern unsigned int func_0200617c(void);
int func_ov016_021b28f4(Rect *rect) {
    int x, y;
    func_02006148(&x, &y);
    if (func_0200617c() != 0 && rect->x <= x &&
        rect->x + rect->w > x && rect->y <= y &&
        rect->y + rect->h > y)
        return 1;
    return 0;
}
