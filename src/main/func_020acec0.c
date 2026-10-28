typedef unsigned short u16;
typedef unsigned char u8;
typedef struct { u8 align, sign, precision_set, alternate, length; u16 conversion; int width, precision; } Format;
extern const u16 data_020c398c[];

const u16 *func_020acec0(const u16 *p, int **args, Format *out) {
    Format f;
    const u16 *q = p + 1;
    int c;
    int flag;
    f.align = 1; f.sign = 0; f.precision_set = 0; f.alternate = 0; f.length = 0; f.width = 0; f.precision = 0;
    c = *q;
    if (c == '%') { f.conversion = c; *out = f; return q + 1; }
    while (1) {
        flag = 1;
        switch (c) {
        case '-': f.align = 0; break;
        case '+': f.sign = 1; break;
        case ' ': if (f.sign != 1) f.sign = 2; break;
        case '#': f.alternate = 1; break;
        case '0': if (f.align != 0) f.align = 2; break;
        default: flag = 0; break;
        }
        if (!flag) break;
        c = *++q;
    }
    if (c == '*') {
        *args += 1; f.width = (*args)[-1];
        if (f.width < 0) { int w = -f.width; f.align = 0; f.width = w; }
        c = *++q;
    } else {
        while (((unsigned int)c >= 128 ? 0 : (data_020c398c[c] & 8))) { f.width = f.width * 10 + (c - '0'); c = *++q; }
    }
    if (f.width > 509) { f.conversion = 0xffff; *out = f; return q + 1; }
    if (c == '.') {
        c = *++q; f.precision_set = 1;
        if (c == '*') {
            *args += 1; f.precision = (*args)[-1]; c = *++q;
            if (f.precision < 0) f.precision_set = 0;
        } else {
            while (((unsigned int)c >= 128 ? 0 : (data_020c398c[c] & 8))) { f.precision = f.precision * 10 + (c - '0'); c = *++q; }
        }
    }
    flag = 1;
    switch (c) {
    case 'h': f.length = 2; if (q[1] == 'h') { f.length = 1; c = *++q; } break;
    case 'l': f.length = 3; if (q[1] == 'l') { f.length = 4; c = *++q; } break;
    case 'L': f.length = 9; break;
    case 'j': f.length = 6; break;
    case 't': f.length = 8; break;
    case 'z': f.length = 7; break;
    default: flag = 0; break;
    }
    if (flag) c = *++q;
    f.conversion = c;
    switch (c) {
    case 'd': case 'i': case 'o': case 'u': case 'x': case 'X':
        if (f.length == 9) f.length = 4;
        if (!f.precision_set) f.precision = 1;
        else if (f.align == 2) f.align = 1;
        break;
    case 'f': case 'F':
        if (f.length == 2 || f.length == 6 || f.length == 7 || f.length == 8 || f.length == 4) f.conversion = 0xffff;
        else if (!f.precision_set) f.precision = 6;
        break;
    case 'a': case 'A':
        if (!f.precision_set) f.precision = 13;
        if (f.length == 2 || f.length == 6 || f.length == 7 || f.length == 8 || f.length == 4 || f.length == 1) f.conversion = 0xffff;
        break;
    case 'g': case 'G': if (f.precision == 0) f.precision = 1;
    case 'e': case 'E':
        if (f.length == 2 || f.length == 6 || f.length == 7 || f.length == 8 || f.length == 4 || f.length == 1) f.conversion = 0xffff;
        else if (!f.precision_set) f.precision = 6;
        break;
    case 'p': f.length = 3; f.alternate = 1; f.conversion = 'x'; f.precision = 8; break;
    case 'c': if (f.length == 3) f.length = 5; else if (f.precision_set || f.length) f.conversion = 0xffff; break;
    case 's': if (f.length == 3) f.length = 5; else if (f.length) f.conversion = 0xffff; break;
    case 'n': if (f.length == 9) f.length = 4; break;
    default: f.conversion = 0xffff; break;
    }
    *out = f; return q + 1;
}












