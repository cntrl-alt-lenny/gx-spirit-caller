/* func_ov002_021d58dc: pack a command into the func_ov002_021d46ac event
 * queue (19 band-callers; sibling of func_ov002_021e277c). arg1/arg3 low
 * bytes become the packed payload; arg0 selects the 0x8000 "set" bit OR'd
 * with command code 0x36; arg2 passes through; the 5th (u16 stack) arg is
 * forwarded as the 4th queue field.
 */

extern int func_ov002_021d46ac(int a, int b, int c, int d);

int func_ov002_021d58dc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4) {
    return func_ov002_021d46ac((unsigned short)((arg0 ? 0x8000 : 0) | 0x36),
                               (unsigned short)((arg1 & 0xff) | ((unsigned char)arg3 << 8)),
                               arg2,
                               arg4);
}
