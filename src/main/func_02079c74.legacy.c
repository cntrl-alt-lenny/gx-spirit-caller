/* func_02079c74: complement n halfwords in place, then add one (carry 1)
 * over the same n halfwords with func_02079cc0 (two's complement negate). */
extern void func_02079cc0(unsigned short *out, unsigned short *in, unsigned int carry, int count);

void func_02079c74(unsigned short *p, int n) {
    int i;
    for (i = 0; i < n; i++) {
        p[i] = ~p[i];
    }
    func_02079cc0(p, p, 1, n);
}
