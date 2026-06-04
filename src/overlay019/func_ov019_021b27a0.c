/* func_ov019_021b27a0: alt-input variant of func_ov019_021b2728 — hit-test the
 * secondary pointer (func_02006148 / func_0200617c) against the rect at r.
 * Returns 1 only while that pointer is down and inside [x, x+w) x [y, y+h).
 */

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
} Rect;

extern void func_02006148(int *px, int *py);
extern int func_0200617c(void);

int func_ov019_021b27a0(Rect *r) {
    int px;
    int py;
    func_02006148(&px, &py);
    if (func_0200617c() != 0 && r->x <= px && r->x + r->w > px && r->y <= py && r->y + r->h > py) {
        return 1;
    }
    return 0;
}
