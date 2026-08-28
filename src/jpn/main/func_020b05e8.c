/* func_020b05e8 (main): parses a decimal digit string into a BCD-ish Num
 * struct, rounding the last stored digit based on the digit right after the
 * 32-digit cutoff. Default tier (r3-spill push, pop{regs,pc}).
 */

typedef unsigned char u8;
typedef short s16;

struct Num {
    u8  flag0;     /* +0x0 */
    u8  pad1;
    s16 exp;       /* +0x2 */
    u8  len;       /* +0x4 */
    u8  digits[1]; /* +0x5 */
};

extern void func_020b0308(struct Num *p, int len);

void func_020b05e8(struct Num *p, const char *s, int exp) {
    int i = 0;

    p->exp = (s16)exp;
    p->flag0 = 0;
    while (i < 0x20 && *s != 0) {
        char c = *s++;
        p->digits[i] = (u8)(c - 0x30);
        i++;
    }
    p->len = (u8)i;

    if (*s == 0) {
        return;
    }
    if (*s < 5) {
        return;
    }
    if (*s <= 5) {
        char c2 = s[1];
        s++;
        if (c2 == 0) {
            goto chk;
        }
        for (;;) {
            if (c2 != 0x30) {
                goto round;
            }
            c2 = *++s;
            if (c2 == 0) {
                goto chk;
            }
        }
    chk:
        {
            u8 last = p->digits[i - 1];
            if ((last & 1) == 0) {
                return;
            }
        }
    }
round:
    func_020b0308(p, p->len);
}
