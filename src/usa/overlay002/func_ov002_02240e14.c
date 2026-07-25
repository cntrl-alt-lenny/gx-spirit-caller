/* func_ov002_02240e14: guard c<5, guard b==(func_ov002_0223dda4(a,0)&0xff),
 * then forward (a,b,c) to func_ov002_022017dc. */

extern unsigned short func_ov002_0223dda4(void *node, int idx);
extern int func_ov002_022017dc(void *a, int b, int c);

int func_ov002_02240e14(void *a, int b, int c) {
    if (c >= 5) return 0;
    if (b != (func_ov002_0223dda4(a, 0) & 0xff)) return 0;
    return func_ov002_022017dc(a, b, c);
}
