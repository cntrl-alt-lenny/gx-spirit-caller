/* func_ov019_021b2628: hit-test the touch point against the rect at r (x/y u16,
 * w/h u8). Returns 1 only while the pen is down (func_02006190) and the point
 * lies inside [x, x+w) x [y, y+h).
 */

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
} Rect;

extern void func_020060f4(int *px, int *py);
extern int func_02006190(void);

int func_ov019_021b2628(Rect *r) {
    int px;
    int py;
    func_020060f4(&px, &py);
    if (func_02006190() != 0 && r->x <= px && r->x + r->w > px && r->y <= py && r->y + r->h > py) {
        return 1;
    }
    return 0;
}
