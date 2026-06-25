/* Ov014_HitTestSecondary: hit-test the secondary pointer against the rect at r
 * (x/y u16, w/h u8). Returns 1 only while that pointer is down (func_0200617c)
 * and the point lies inside [x, x+w) x [y, y+h). (Same shape as ov019 021b27a0.)
 */

typedef struct {
    unsigned short x;
    unsigned short y;
    unsigned char w;
    unsigned char h;
} Rect;

extern void func_02006148(int *px, int *py);
extern int func_0200617c(void);

int Ov014_HitTestSecondary(int a0, Rect *r) {
    int px;
    int py;
    func_02006148(&px, &py);
    if (func_0200617c() != 0 && r->x <= px && r->x + r->w > px && r->y <= py && r->y + r->h > py) {
        return 1;
    }
    return 0;
}
