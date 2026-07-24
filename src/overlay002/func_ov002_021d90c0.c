/* func_ov002_021d90c0: 021d479c arg-pack tail-call, kind 0x3a, flag->0x8000
 * bit. Needs (unsigned)arg2 >> 16 to get lsr not asr for the hi half. */
extern int func_ov002_021d479c(int packed, int a, int b, int c);

int func_ov002_021d90c0(int flag, int arg1, int arg2) {
    unsigned char a1 = (unsigned char)arg1;
    unsigned short packed = (unsigned short)((flag ? 0x8000 : 0) | 0x3a);
    return func_ov002_021d479c(packed, a1, (unsigned short)arg2,
                                (unsigned short)((unsigned)arg2 >> 16));
}
