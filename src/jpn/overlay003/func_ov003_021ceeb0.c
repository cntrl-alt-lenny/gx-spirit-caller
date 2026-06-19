/* func_ov003_021ceeb0: hit-test the touch point against the widget rect — true
 * iff the pen is down and (x,y) lies inside [rect.x, rect.x+rect.w) ×
 * [rect.y, rect.y+rect.h). Returns the hit flag. One of a 2-member family
 * (ov003_core.h; ov005 bounds-check recipe). */
extern void func_020060f4(int *, int *);
extern int  func_02006190(void);
int func_ov003_021ceeb0(int dummy, void *rect) {
    int x, y;
    func_020060f4(&x, &y);
    if (func_02006190() != 0 && *(unsigned short *)rect <= x &&
        *(unsigned short *)rect + *(unsigned char *)((char *)rect + 4) > x &&
        *(unsigned short *)((char *)rect + 2) <= y &&
        *(unsigned short *)((char *)rect + 2) +
                *(unsigned char *)((char *)rect + 5) >
            y)
        return 1;
    return 0;
}
