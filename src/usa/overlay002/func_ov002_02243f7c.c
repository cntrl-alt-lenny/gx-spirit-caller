/* func_ov002_02243f7c: sub-shape 3 sibling.
 *
 * Same shape + same recipe as 022301a8 but different helper. */
extern int func_ov002_02257bc0(unsigned short *dst, unsigned short *src);

int func_ov002_02243f7c(unsigned short *dst, unsigned short *src) {
    int r;
    *dst = *src;
    r = func_ov002_02257bc0(dst, src);
    *dst = 0x183e;
    return r;
}
