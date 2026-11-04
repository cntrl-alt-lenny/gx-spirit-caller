extern char data_020bece4[];
extern void func_02054a30(char *src, unsigned char *dst, int len);

void func_020548f4(char *src, char *dst, int len, int mode) {
    char *tbl;
    char *start = dst;
    int left = len;
    char *end;
    char c;
    int rem;

    switch (mode) {
    case 1:
        tbl = data_020bece4 + 0x6c;
        break;
    case 2:
        tbl = data_020bece4 + 0x70;
        break;
    default:
        tbl = data_020bece4 + 0x74;
        break;
    }

    while (left > 0) {
        func_02054a30(src, (unsigned char *)dst, len >= 3 ? 3 : len);
        left -= 3;
        dst += 4;
        src += 3;
    }

    end = dst;
    rem = len % 3;
    if (rem == 1) {
        end = dst - 2;
    } else if (rem == 2) {
        end = dst - 1;
    }

    *dst = 0;
    if (dst <= start) {
        return;
    }
    do {
        dst--;
        if (dst >= end) {
            *dst = tbl[2];
        } else {
            c = *dst;
            if (c <= 25) {
                *dst = c + 0x41;
            } else if (c <= 51) {
                *dst = c + 0x47;
            } else if (c <= 61) {
                *dst = c - 4;
            } else if (c == 62) {
                *dst = tbl[0];
            } else if (c == 63) {
                *dst = tbl[1];
            }
        }
    } while (dst > start);
}
