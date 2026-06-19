/* func_ov005_021ac87c: clamp the requested column count to what fits — query
 * the layout helper for the count at the current style (4-bit field at bit 6 of
 * the +0x5c attribute halfword), then cap it at (height span)/16. Returns the
 * smaller of the two. (ov005_core.h) */
extern int func_ov005_021ab028(void *, int);
int func_ov005_021ac87c(void *o) {
    int x = func_ov005_021ab028(
        *(void **)o,
        ((unsigned)*(unsigned short *)((char *)o + 0x5c) << 22) >> 28);
    int d = (*(short *)((char *)o + 0x12) - *(short *)((char *)o + 0xe)) / 16;
    {
        int r = d;
        if (x <= d)
            r = x;
        return r;
    }
}
