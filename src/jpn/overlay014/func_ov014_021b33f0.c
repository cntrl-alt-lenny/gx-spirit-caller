/* func_ov014_021b33f0: hit-test the secondary pointer against the rect at r
 * (x/y u16, w/h u8). Returns 1 only while that pointer is down (func_02006160)
 * and the point lies inside [x, x+w) x [y, y+h). (Same shape as ov019 021b27a0.)
 */

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
} Rect;

extern void func_0200612c(int *px, int *py);
extern int func_02006160(void);

int func_ov014_021b33f0(int a0, Rect *r) {
    int px;
    int py;
    func_0200612c(&px, &py);
    if (func_02006160() != 0 && r->x <= px && r->x + r->w > px && r->y <= py && r->y + r->h > py) {
        return 1;
    }
    return 0;
}
