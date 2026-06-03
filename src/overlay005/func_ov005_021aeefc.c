#include "ov005_core.h"
extern void func_02006148(int *, int *);
extern int func_0200617c(void);
struct Ov005Rect { unsigned short x, y; unsigned char w, h; };
int func_ov005_021aeefc(int a0, struct Ov005Rect *r) {
    int A, B;
    func_02006148(&A, &B);
    if (func_0200617c() != 0 &&
        r->x <= A && r->x + r->w > A &&
        r->y <= B && r->y + r->h > B) {
        return 1;
    }
    return 0;
}
