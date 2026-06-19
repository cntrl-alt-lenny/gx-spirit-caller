#include "ov005_core.h"
extern void func_020060f4(int *, int *);
extern int func_02006190(void);
struct Ov005Rect { unsigned short x, y; unsigned char w, h; };
int func_ov005_021aed7c(int a0, struct Ov005Rect *r) {
    int A, B;
    func_020060f4(&A, &B);
    if (func_02006190() != 0 &&
        r->x <= A && r->x + r->w > A &&
        r->y <= B && r->y + r->h > B) {
        return 1;
    }
    return 0;
}
