/* func_ov002_02244064: sub-shape 3 sibling.
 *
 * Same shape + same recipe as 022301a8 but different helper. */
extern int func_ov002_02257ca8(unsigned short *dst, unsigned short *src);

int func_ov002_02244064(unsigned short *dst, unsigned short *src) {
    int r;
    *dst = *src;
    r = func_ov002_02257ca8(dst, src);
    *dst = 0x183e;
    return r;
}
