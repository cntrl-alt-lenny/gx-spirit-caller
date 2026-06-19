/* func_ov017_021b2c5c: sibling of 021b2ce4 — same rect hit-test but against
 * the alternate input source (func_0200612c / func_02006160).
 */

extern void func_0200612c(int *x, int *y);
extern int func_02006160(void);

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
} Rect;

int func_ov017_021b2c5c(Rect *r) {
    int x, y;
    func_0200612c(&x, &y);
    if (func_02006160() != 0 &&
        r->x <= x && r->x + r->w > x &&
        r->y <= y && r->y + r->h > y)
        return 1;
    return 0;
}
