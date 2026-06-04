/* func_ov017_021b2d5c: sibling of 021b2ce4 — same rect hit-test but against
 * the alternate input source (func_02006148 / func_0200617c).
 */

extern void func_02006148(int *x, int *y);
extern int func_0200617c(void);

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
} Rect;

int func_ov017_021b2d5c(Rect *r) {
    int x, y;
    func_02006148(&x, &y);
    if (func_0200617c() != 0 &&
        r->x <= x && r->x + r->w > x &&
        r->y <= y && r->y + r->h > y)
        return 1;
    return 0;
}
