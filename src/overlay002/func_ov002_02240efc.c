/* func_ov002_02240efc: guard c<5, guard b==(func_ov002_0223de94(a,0)&0xff),
 * then forward (a,b,c) to func_ov002_022018cc. */

extern unsigned short func_ov002_0223de94(void *node, int idx);
extern int func_ov002_022018cc(void *a, int b, int c);

int func_ov002_02240efc(void *a, int b, int c) {
    if (c >= 5) return 0;
    if (b != (func_ov002_0223de94(a, 0) & 0xff)) return 0;
    return func_ov002_022018cc(a, b, c);
}
