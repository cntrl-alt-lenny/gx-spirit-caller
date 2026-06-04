/* func_ov019_021b2728: hit-test the touch point against the rect at r (x/y u16,
 * w/h u8). Returns 1 only while the pen is down (func_020061ac) and the point
 * lies inside [x, x+w) x [y, y+h).
 */

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
} Rect;

extern void func_02006110(int *px, int *py);
extern int func_020061ac(void);

int func_ov019_021b2728(Rect *r) {
    int px;
    int py;
    func_02006110(&px, &py);
    if (func_020061ac() != 0 && r->x <= px && r->x + r->w > px && r->y <= py && r->y + r->h > py) {
        return 1;
    }
    return 0;
}
