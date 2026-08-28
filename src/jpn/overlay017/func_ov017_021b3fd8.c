/* func_ov017_021b3fd8: render the decimal digits of `val` as a sequence of
 * 6-byte "draw command" records, advancing an X field (`x`) left by 8 per
 * digit. `flags & 0xff` is a palette/attribute byte OR'd with 0x40000000
 * into a packed 32-bit header alongside `x`. If `count == 0`, emit digits
 * (least-significant first) until `val` reaches 0 (variable-width); else
 * emit exactly `count` digits (fixed-width, e.g. zero-padded). Each record
 * is built in a local 6-byte struct and handed to func_020943b0 at a
 * destination slot obtained from func_02005d90(2, 0). Returns the final x.
 *
 * `a0` (r0) is loaded into a param register at entry but is never read
 * again before being clobbered by the `flags & 0xff` mask -- it is a
 * genuinely unused parameter in this function (confirmed: no instruction
 * reads original r0 after entry).
 *
 * Struct layout confirmed against an already-matched sibling with the
 * identical 3-call shape (func_02005d90(2,0) -> func_020943b0(buf,handle,N)):
 * see src/overlay008/func_ov008_021abb08.c's `Packed { unsigned int tag;
 * unsigned short param; }`, built the same way via
 * `hdr | (((unsigned)x << 23) >> 7)` for the tag word. Here sizeof rounds
 * to 8 bytes (4 + 2, aligned), matching this function's `sub sp, sp, #0x8`.
 */

typedef struct {
    unsigned int tag;
    unsigned short param;
} DrawCmd;

extern int  func_02005d90(int a, int b);
extern void func_020943b0(void *buf, int handle, int count);

int func_ov017_021b3fd8(int a0, int val, int x, int flags, int count)
{
    DrawCmd buf;
    unsigned int hdr;
    int ret;

    if (count == 0) {
        hdr = ((unsigned int)flags & 0xff) | 0x40000000;
        do {
            int digit = val % 10;
            unsigned short code = (unsigned short)((digit + 0x27c) | 0x1400);
            x -= 8;
            buf.param = code;
            buf.tag = hdr | (((unsigned int)x << 23) >> 7);
            val = val / 10;
            ret = func_02005d90(2, 0);
            func_020943b0(&buf, ret, 6);
        } while (val > 0);
    } else {
        hdr = ((unsigned int)flags & 0xff) | 0x40000000;
        do {
            int digit = val % 10;
            buf.param = (unsigned short)((digit + 0x27c) | 0x1400);
            val = val / 10;
            x -= 8;
            buf.tag = hdr | (((unsigned int)x << 23) >> 7);
            ret = func_02005d90(2, 0);
            func_020943b0(&buf, ret, 6);
        } while (--count > 0);
    }

    return x;
}
