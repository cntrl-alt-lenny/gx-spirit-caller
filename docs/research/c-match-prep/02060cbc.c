/* CAMPAIGN-PREP candidate for func_02060cbc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: 2-byte unrolled copy loop, ptr post-inc copy, store-order, bind flag<<8 base.
 *   risk:       struct-guessed: tail pointer math is murky — orig builds src=a0+ret and dst=_LIT3+(flag<<8); the func_020aaddc return-vs-void and the ptr arithmetic are inferred, likely diverge on the add/lsl#8 sequence and copy-loop reg-alloc.
 *   confidence: low
 */
/* func_02060cbc — copy 0x100-byte table to stack, toggle flag, format, then
 * copy a string up to NUL or '\\'. (class D: store-order / byte loop.)
 */
typedef unsigned char u8;
typedef signed char s8;
typedef unsigned int u32;

extern u8 data_020bed6c[];        /* 0x100-byte source table (_LIT0)        */
extern u32 data_0219e520;         /* toggled int flag (_LIT1)               */
extern char data_021013f4[];      /* format/arg passed as r1 to func (_LIT2)*/
extern s8 data_0219e728[];        /* base of string table (_LIT3)           */

extern void func_020aaf10(void *dst, const void *src);
extern int  func_020ab0c4(int a, void *buf);
extern int  func_020aaddc(void *buf);

int func_02060cbc(int a0)
{
    u8 buf[0x100];
    int i;
    int r;
    s8 *src;
    s8 *dst;

    /* 128 iterations, two bytes per iter (matches ldrb/ldrb + strb/strb x128) */
    for (i = 0; i < 0x80; i++) {
        buf[i * 2]     = data_020bed6c[i * 2];
        buf[i * 2 + 1] = data_020bed6c[i * 2 + 1];
    }

    data_0219e520 = data_0219e520 ^ 1;
    func_020aaf10(buf, &data_0219e520);
    func_020aaf10(buf, data_021013f4);

    r = func_020ab0c4(a0, buf);
    if (r == 0)
        return 0;

    /* dst = table + (flag << 8); src = a0 + ret(aaddc). copy until NUL or '\\'. */
    dst = &data_0219e728[(int)data_0219e520 << 8];
    src = (s8 *)(a0 + func_020aaddc(buf));
    while (*src != 0 && *src != 0x5c) {
        *dst++ = *src++;
    }
    *dst = 0;
    return r;
}
