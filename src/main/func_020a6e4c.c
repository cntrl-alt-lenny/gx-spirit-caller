typedef struct File {
    int f0;
    unsigned int pad0 : 2;
    unsigned int sub : 3;
    unsigned int kind : 2;
    unsigned int mode : 3;
    unsigned int pad1 : 2;
    unsigned int flagA : 1;
    unsigned int rest : 19;
    unsigned int state : 3;
    unsigned int pad2 : 29;
    unsigned char fC;
    unsigned char error;
    unsigned char padE[10];
    int f18;
    char *bufStart;
    unsigned int bufSize;
    char *bufPtr;
    unsigned int avail;
} File;

extern int func_020ace14(File *p, int a);
extern void func_020a6d94(File *p);
extern int func_020a6dc4(File *p, unsigned int *out);
extern char *func_020a7414(char *s, int c, unsigned int n);
extern void *func_020a7368(char *dst, char *src, unsigned int n);
extern unsigned int func_020b3a7c(unsigned int a, unsigned int b);

unsigned int func_020a6e4c(char *dst, unsigned int size, unsigned int count, File *p) {
    int full;
    unsigned int n;
    unsigned int total;
    char *found;
    unsigned int chunk;

    if (func_020ace14(p, 0) == 0) {
        func_020ace14(p, -1);
    }
    n = size * count;
    if (n == 0 || p->error != 0 || p->mode == 0) {
        return 0;
    }
    full = (p->flagA == 0 || p->kind == 2 || p->kind == 1);
    if (p->state == 0 && (p->sub & 2)) {
        p->state = 1;
        func_020a6d94(p);
    }
    if (p->state != 1) {
        p->error = 1;
        p->avail = 0;
        return 0;
    }
    total = 0;
    if (n != 0 && (p->bufPtr != p->bufStart || full != 0)) {
        p->avail = p->bufSize - (p->bufPtr - p->bufStart);
        do {
            chunk = p->avail;
            found = 0;
            if (chunk > n) {
                chunk = n;
            }
            if (p->kind == 1 && chunk != 0) {
                found = func_020a7414(dst, 10, chunk);
                if (found != 0) {
                    chunk = found + 1 - dst;
                }
            }
            if (chunk != 0) {
                func_020a7368(p->bufPtr, dst, chunk);
                dst += chunk;
                n -= chunk;
                p->bufPtr += chunk;
                p->avail -= chunk;
            }
            if (p->avail == 0 || found != 0 || p->kind == 0) {
                if (func_020a6dc4(p, 0) != 0) {
                    p->error = 1;
                    n = 0;
                    p->avail = 0;
                    break;
                }
            }
            total += chunk;
        } while (n != 0 && full != 0);
    }
    if (n != 0 && full == 0) {
        char *oldStart = p->bufStart;
        unsigned int oldSize = p->bufSize;
        p->bufStart = dst;
        p->bufSize = n;
        p->bufPtr = dst + n;
        if (func_020a6dc4(p, &chunk) == 0) {
            total += chunk;
        } else {
            p->error = 1;
            p->avail = 0;
        }
        p->bufStart = oldStart;
        p->bufSize = oldSize;
        func_020a6d94(p);
        p->avail = 0;
    }
    if (p->kind != 2) {
        p->avail = 0;
    }
    return func_020b3a7c(total, size);
}
