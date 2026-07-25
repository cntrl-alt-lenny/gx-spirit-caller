/* func_ov019_021b4b1c: per-frame step. If flag at +0xb8 set, run
 * func_ov019_021b4b60; else if flag at +0xbc set, run func_ov019_021b4ec8 and
 * then clamp-advance the counter at +0xc4 (+0x10 while < 0x50). Always ret 1.
 * ov019_core.h flagged this as a 70% caller-saved-flag-load near-miss in an
 * earlier attempt; this straightforward if/else form reproduces it clean. */
extern void func_ov019_021b4b60(int *p);
extern void func_ov019_021b4ec8(int *p);

int func_ov019_021b4b1c(int *p) {
    if (p[0xb8 / 4] != 0) {
        func_ov019_021b4b60(p);
    } else {
        if (p[0xbc / 4] != 0) {
            func_ov019_021b4ec8(p);
        }
        if (p[0xc4 / 4] < 0x50) {
            p[0xc4 / 4] += 0x10;
        }
    }
    return 1;
}
