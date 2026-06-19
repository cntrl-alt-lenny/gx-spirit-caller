/* func_ov019_021b26a0: alt-input variant of func_ov019_021b2628 — hit-test the
 * secondary pointer (func_0200612c / func_02006160) against the rect at r.
 * Returns 1 only while that pointer is down and inside [x, x+w) x [y, y+h).
 */

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
} Rect;

extern void func_0200612c(int *px, int *py);
extern int func_02006160(void);

int func_ov019_021b26a0(Rect *r) {
    int px;
    int py;
    func_0200612c(&px, &py);
    if (func_02006160() != 0 && r->x <= px && r->x + r->w > px && r->y <= py && r->y + r->h > py) {
        return 1;
    }
    return 0;
}
