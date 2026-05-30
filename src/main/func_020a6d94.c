/* func_020a6d94: frameless-leaf dead-store + re-load (volatile + delayed temp, gotcha 17). */
struct S6d94 { int f0, f4, f8, f12, f16, f20; volatile int f24; int f28, f32, f36; volatile int f40; int f44, f48, f52; };
void func_020a6d94(struct S6d94 *p) {
    int t;
    p->f36 = p->f28;
    t = p->f32;
    p->f40 = t;
    p->f40 = t - (p->f24 & p->f44);
    p->f52 = p->f24;
}
