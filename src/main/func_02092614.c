/* func_02092614: frameless-leaf re-read kept via volatile (gotcha 17). */
struct V92614 { volatile int f0, f4, f8, f12, f16, f20, f24, f28; };
void func_02092614(struct V92614 *p, int a1, int a2) {
    p->f4 = 0;
    p->f0 = p->f4;
    p->f12 = 0;
    p->f8 = p->f12;
    p->f16 = a1;
    p->f20 = a2;
    p->f24 = 0;
    p->f28 = 0;
}
