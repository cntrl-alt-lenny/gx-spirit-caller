extern char *Strchr(const char *s, int c);
extern void func_02094688(const void *src, void *dst, int n);

int func_0204e868(char *out, char *path, int count) {
    char *end = Strchr(path, 0);
    int i;
    char *p = path;
    char *next;

    for (i = 0; i < count; i++) {
        next = Strchr(p, '/');
        if (next == 0) {
            return -1;
        }
        p = next + 1;
    }
    next = Strchr(p, '/');
    if (next == 0) {
        next = end;
    }
    if (p == next) {
        return -1;
    }
    {
        int len = next - p;
        func_02094688(p, out, len);
        out[len] = 0;
        return len;
    }
}
