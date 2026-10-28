struct ResetState { char pad[0xc88]; int a, b; };
extern struct ResetState data_ov004_0220e500;
extern char data_ov004_0220b500[], data_ov004_022915e8[], data_02104f4c[];
extern int func_0201cd1c(int, unsigned short *, int);
extern int func_0201cfa0(void), func_0201cfe0(void), func_0201d34c(void), func_02021c0c(void);
extern int func_0202c028(int);
extern char *func_0202c0c0(int);
extern void func_020822f0(void), func_02084fe0(void);
/* Original caller supplies a fourth argument, although the callee ignores it. */
extern void func_ov004_021c9dd4(void *, void *, int, int);
extern void func_ov004_021d0168(int), func_ov004_021d02f4(void), func_ov004_021d0530(void *), func_ov004_021d05f4(int), func_ov004_021d0e98(int);
extern void func_ov004_021d1360(void), func_ov004_021d13dc(void), func_ov004_021d1448(void), func_ov004_021d1b08(void), func_ov004_021d2628(void);
extern int func_ov004_021d2aac(void), func_ov004_021d2c40(void);
extern void func_ov004_021d8798(void *, const char *, int), func_ov004_021d8cd0(void *), func_ov004_021d8d58(void *), func_ov004_021d9134(void *);
static inline int active(void *p) { int result = 0; if (*(int *)p != 0) result = 1; return result; }
static inline void clear(int x) { *(volatile unsigned int *)0x04000540 = x; }
static inline int mode(void *p) { return *(int *)((char *)p + 0x44); }
static inline void reset(void *p, int x) { *(int *)((char *)p + 0xc88) = x; }
int func_ov004_021d2ec4(void) {
    unsigned short buf1[12];
    unsigned short buf2[12];
    unsigned short small;
    char *b;
    struct ResetState *a = &data_ov004_0220e500;
    int n, i, t;
    unsigned int cost;
    t = -1;
    a->a = t;
    b = data_ov004_0220b500;
    *(int *)(b + 0x9c) = *(int *)(b + 0xa0) = t;
    a->b = 0;
    if (func_0201cfa0() == 0) {
        *(int *)(b + 0x48) = 0;
        *(int *)(b + 0x54) = 0;
        *(int *)(b + 0x58) = 0;
        *(int *)(b + 0x8c) = 0;
        if (active(data_ov004_022915e8)) func_ov004_021d8cd0(data_ov004_022915e8);
        if (*(int *)(data_ov004_0220b500 + 0x44) != 0) {
            func_ov004_021d8d58(data_ov004_022915e8);
            func_ov004_021d02f4(); func_02021c0c(); func_ov004_021d2628();
            func_ov004_021d9134(data_ov004_022915e8);
            func_020822f0(); func_02084fe0();
            clear(0);
            return 0;
        }
    } else if (*(int *)(data_ov004_0220b500 + 0x44) != 0) {
        if (func_ov004_021d2c40() == 0 && func_0201d34c() == 0) {
            switch (*(int *)(b + 0x54)) {
            case 14:
                if (*(int *)(b + 0x3c6c) != 0) ++*(int *)(b + 0x3c6c);
                if (*(int *)(b + 0x3c70) != 0) ++*(int *)(b + 0x3c70);
                if (*(int *)(b + 0x3c6c) > 30 && *(int *)(b + 0x3c70) > 30) {
                    *(int *)(b + 0x3c78) = 0;
                    *(int *)(b + 0x3c74) = 0;
                    ++*(int *)(b + 0x54);
                }
                break;
            case 15:
                if ((unsigned int)(*(int *)data_ov004_022915e8 != 0) == 0) {
                    if (1 - *(int *)(data_ov004_022915e8 + 8)) {
                        cost = (func_0202c028(*(int *)(b + *(int *)(b + 0x3c68) * 4 + 0x3c3c)) * 7) / 10;
                        if (cost <= *(unsigned int *)(data_02104f4c + 0xa60)) func_ov004_021d1360();
                        else {
                            func_ov004_021d8798(data_ov004_022915e8, func_0202c0c0(0x101), 1);
                            func_ov004_021d13dc(); func_ov004_021d0168(0);
                        }
                    } else {
                        func_ov004_021d8798(data_ov004_022915e8, func_0202c0c0(0x101), 1);
                        func_ov004_021d13dc(); func_ov004_021d0168(0);
                    }
                }
                break;
            case 16:
                if (*(int *)(b + 0x3c74) != 0) ++*(int *)(b + 0x3c74);
                if (*(int *)(b + 0x3c78) != 0) ++*(int *)(b + 0x3c78);
                if (*(int *)(b + 0x3c74) != 0) {
                    t = *(int *)(b + 0x3c78);
                    if (*(int *)(b + 0x3c74) <= t) t = *(int *)(b + 0x3c74);
                    if (func_0201cfe0() != 0 && t == 192) {
                        small = 16; func_0201cd1c(6, &small, 2);
                    }
                }
                break;
            case 17:
                n = *(int *)(b + 0x3c0c);
                if (n != 0) {
                    buf1[0] = 12; buf1[1] = n;
                    for (i = 0; i < n; i++) buf1[i + 2] = ((int *)b)[i + 0xf05];
                    func_0201cd1c(6, buf1, 24);
                }
                *(int *)(b + 0x54) = 14;
                break;
            }
        }
        func_ov004_021d8d58(data_ov004_022915e8);
        func_ov004_021d02f4(); func_02021c0c(); func_ov004_021d2628();
        func_ov004_021d9134(data_ov004_022915e8);
        func_020822f0(); func_02084fe0();
        clear(0);
        return 0;
    } else {
        if (func_ov004_021d2aac() == 0 && func_0201d34c() == 0) {
            switch (*(int *)(b + 0x54)) {
            case 14:
                if (*(int *)(b + 0x3c6c) != 0) ++*(int *)(b + 0x3c6c);
                if (*(int *)(b + 0x3c70) != 0) ++*(int *)(b + 0x3c70);
                func_ov004_021d1448();
                if (*(int *)(b + 0x3c6c) > 30 && *(int *)(b + 0x3c70) > 30) {
                    func_ov004_021d0e98(1);
                    *(int *)(b + 0x3c78) = 0;
                    *(int *)(b + 0x3c74) = 0;
                    ++*(int *)(b + 0x54);
                    func_ov004_021d05f4(0); func_ov004_021d0530((void *)0x3c3);
                }
                break;
            case 15:
                if (*(int *)(b + 0x3c74) != 0) ++*(int *)(b + 0x3c74);
                if (*(int *)(b + 0x3c78) != 0) ++*(int *)(b + 0x3c78);
                func_ov004_021d1448();
                break;
            case 17:
                n = *(int *)(b + 0x3c0c);
                if (n != 0) {
                    buf2[0] = 12; buf2[1] = n;
                    for (i = 0; i < n; i++) buf2[i + 2] = ((int *)b)[i + 0xf05];
                    func_0201cd1c(6, buf2, 24);
                }
                *(int *)(b + 0x54) = 14;
                break;
            }
        }
    }
    func_ov004_021d1b08();
    func_ov004_021c9dd4((void *)0x05000638, b + 0x5ef0, 4, 0x00600100);
    func_020822f0(); func_02084fe0();
    clear(0);
    return 0;
}









