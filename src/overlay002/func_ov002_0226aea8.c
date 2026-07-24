/* func_ov002_0226aea8: build a u16 flags word from two boolean args (bits
 * 0x1/0x8) OR'd with 0x30, tail-call func_ov002_0226acf8(arg0, 2, u16 arg1,
 * flags). */
extern int func_ov002_0226acf8(int a, int b, int c, int d);

int func_ov002_0226aea8(int arg0, int arg1, int arg2, int arg3) {
    unsigned short flags = 0;
    if (arg2)
        flags |= 1;
    if (arg3)
        flags |= 8;
    flags |= 0x30;
    return func_ov002_0226acf8(arg0, 2, (unsigned short)arg1, flags);
}
