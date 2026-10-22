typedef struct {
    unsigned char suppress, width_set, length, conversion;
    int width;
    unsigned char set[32];
} ScanFormat;
extern const ScanFormat data_020c3854;
extern const unsigned short data_020c3754[];
#define ISDIGIT(c) (((c) < 0 || (c) >= 128) ? 0 : (data_020c3754[(c)] & 8))
const char *func_020a9960(const char *input, ScanFormat *out) {
    ScanFormat f = data_020c3854;
    const char *format;
    int c;
    int modifier;
    int invert;
    int end;
    unsigned char *p;
    int i;
    c = input[1];
    format = input + 1;
    if (c == '%') {
        f.conversion = c;
        *out = f;
        return format + 1;
    }
    if (c == '*') {
        f.suppress = 1;
        c = *++format;
    }
    if (ISDIGIT(c)) {
        f.width = 0;
        do {
            f.width = f.width * 10 + (c - '0');
            c = *++format;
        } while (ISDIGIT(c));
        if (f.width == 0) {
            f.conversion = 255;
            *out = f;
            return format + 1;
        }
        f.width_set = 1;
    }
    modifier = 1;
    switch(c) {
    case 'h':
        f.length = 2;
        if (format[1] == 'h') {
            f.length = 1;
            c = *++format;
        }
        break;
    case 'l':
        f.length = 3;
        if (format[1] == 'l') {
            f.length = 7;
            c = *++format;
        }
        break;
    case 'L': f.length = 9; break;
    case 'j': f.length = 4; break;
    case 'z': f.length = 5; break;
    case 't': f.length = 6; break;
    default: modifier = 0; break;
    }
    if (modifier) c = *++format;
    f.conversion = c;
    switch(c) {
    case 'd': case 'i': case 'o': case 'u': case 'x': case 'X':
        if (f.length == 9) f.conversion = 255;
        break;
    case 'a': case 'A': case 'e': case 'E': case 'f': case 'F': case 'g': case 'G':
        if (f.length == 1 || f.length == 2 || (unsigned char)(f.length + 252) <= 3) f.conversion = 255;
        else if (f.length == 3) f.length = 8;
        break;
    case 'p':
        f.length = 3;
        f.conversion = 'x';
        break;
    case 'c':
        if (f.length == 3) f.length = 10;
        else if (f.length != 0) f.conversion = 255;
        break;
    case 's':
        if (f.length == 3) f.length = 10;
        else if (f.length != 0) f.conversion = 255;
        p = f.set;
        for (i = 32; i > 0; --i) *p++ = 255;
        f.set[1] = 193;
        f.set[4] = 254;
        break;
    case '[':
        if (f.length == 3) f.length = 10;
        else if (f.length != 0) f.conversion = 255;
        c = *++format;
        invert = 0;
        if (c == '^') {
            c = *++format;
            invert = 1;
        }
        if (c == ']') {
            f.set[11] |= 32;
            c = *++format;
        }
        while (c != 0 && c != ']') {
            f.set[(unsigned char)c >> 3] |= 1 << (c & 7);
            if (format[1] == '-' && (end = format[2]) != 0 && end != ']') {
                for (++c; c <= end; ++c) f.set[(unsigned char)c >> 3] |= 1 << (c & 7);
                c = *(format += 3);
            } else c = *++format;
        }
        if (c == 0) f.conversion = 255;
        else if (invert) {
            unsigned char *q = f.set;
            int n = 32;
            do { int value = *q; --n; *q++ = ~value; } while (n > 0);
        }
        break;
    case 'n': break;
    default: f.conversion = 255; break;
    }
    *out = f;
    return format + 1;
}











