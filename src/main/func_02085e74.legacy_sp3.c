typedef unsigned int u32;

extern int func_02084e0c(int id, char *p, int n);

int func_02085e74(u32 *p)
{
    char *b = (char *)p;
    u32 f = *p;
    int need = 0;
    int t;
    if (!(f & 4)) {
        need = 1;
    }
    if ((f & 0x20) && !(f & 8)) {
        if (need != 0) {
            func_02084e0c(0x1c, b + 0x4c, 3);
            need = 0;
        }
        func_02084e0c(0x1b, b + 0x10, 3);
    }
    if (!(*p & 2)) {
        if (need != 0) {
            func_02084e0c(0x19, b + 0x28, 0xc);
        } else {
            func_02084e0c(0x1a, b + 0x28, 9);
        }
    } else if (need != 0) {
        func_02084e0c(0x1c, b + 0x4c, 3);
    }
    t = *p & 1;
    if (t != 0) {
        return t;
    }
    return func_02084e0c(0x1b, b + 4, 3);
}
