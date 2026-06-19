#include "ov005_core.h"
extern void func_0200612c(int *, int *);
extern int func_02006160(void);
struct Ov005Rect { unsigned short x, y; unsigned char w, h; };
int func_ov005_021aedf4(int a0, struct Ov005Rect *r) {
    int A, B;
    func_0200612c(&A, &B);
    if (func_02006160() != 0 &&
        r->x <= A && r->x + r->w > A &&
        r->y <= B && r->y + r->h > B) {
        return 1;
    }
    return 0;
}
