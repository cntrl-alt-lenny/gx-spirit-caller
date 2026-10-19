#include <nitro/types.h>
int func_020aaf40(const u8 *a, const u8 *b) {
    u32 c, d;
    int diff;
    u32 n;
    c = *a;
    diff = c - *b;
    if (diff) return diff;
    n = (u32)a & 3;
    if (((u32)b & 3) == n) {
        if (n) {
            if (!c) return 0;
            n = 3 - n;
            while (n) {
                c = *++a;
                diff = c - *++b;
                if (diff) return diff;
                if (!c) return 0;
                --n;
            }
            ++a;
            ++b;
        }
        c = *(const u32 *)a;
        d = *(const u32 *)b;
        if ((c + 0xfefefeff) & ~c & 0x80808080) goto byte_compare;
        while (c == d) {
            a += 4;
            b += 4;
            c = *(const u32 *)a;
            d = *(const u32 *)b;
            if ((c + 0xfefefeff) & 0x80808080) goto byte_compare;
        }
        --a;
        --b;
        goto byte_advance;
byte_compare:
        c = *a;
        diff = c - *b;
        if (diff) return diff;
    }
byte_advance:
    if (!c) return 0;
    do {
        c = *++a;
        diff = c - *++b;
        if (diff) return diff;
    } while (c);
    return 0;
}

