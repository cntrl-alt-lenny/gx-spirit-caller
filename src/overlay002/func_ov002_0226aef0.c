/* func_ov002_0226aef0: build a u16 flags value from two boolean tests and
 * tail-call the sink with (a, 2, b, flags). Sink params 3/4 MUST be u16 (not
 * short) so the caller truncates with lsr, matching the orig (see
 * func_ov002_0226acf8's documented signature). */

extern void func_ov002_0226acf8(int arg0, int arg1, unsigned short arg2, unsigned short arg3);

void func_ov002_0226aef0(int a, int b, int c, int d) {
    unsigned short flags = 0;
    if (c != 0) flags |= 1;
    if (d != 0) flags |= 8;
    flags |= 0x20;
    func_ov002_0226acf8(a, 2, (unsigned short)b, flags);
}
