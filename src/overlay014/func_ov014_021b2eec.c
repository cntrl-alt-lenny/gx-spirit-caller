extern void func_0208c884(unsigned short *a0, int a1);
extern int func_ov014_021b3568(char *self);
int func_ov014_021b2eec(char *self) {
    int done = 0;
    switch (*(int *)self) {
    case 0:
        ++*(int *)(self + 8);
        func_0208c884((unsigned short *)0x0400006c, *(int *)(self + 8) - 16);
        func_0208c884((unsigned short *)0x0400106c, *(int *)(self + 8) - 16);
        if (*(int *)(self + 8) >= 16) {
            *(int *)self = 1;
            *(int *)(self + 8) = 0;
        }
        break;
    case 1:
        if (func_ov014_021b3568(self)) *(int *)self = 2;
        break;
    case 2:
        ++*(int *)(self + 8);
        func_0208c884((unsigned short *)0x0400006c, -*(int *)(self + 8));
        func_0208c884((unsigned short *)0x0400106c, -*(int *)(self + 8));
        if (*(int *)(self + 8) >= 16) done = 1;
        break;
    }
    return done;
}
