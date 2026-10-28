typedef struct {
    unsigned char pad, sign, precision, alternate, length, conversion;
    int width, digits;
} Format;
extern unsigned short data_020c3754[];

signed char *func_020a7530(signed char *format, int **args, Format *out)
{
    Format f;
    int c;
    signed char *fmt;
    int flag;
    f.pad = 1;
    f.sign = 0;
    f.precision = 0;
    f.alternate = 0;
    f.length = 0;
    f.width = 0;
    f.digits = 0;
    c = *(fmt = format + 1);
    if (c == '%') {
        f.conversion = c;
        *out = f;
        return fmt + 1;
    }
    do {
        flag = 1;
        switch (c) {
        case '-': f.pad = 0; break;
        case '+': f.sign = 1; break;
        case ' ': if (f.sign != 1) f.sign = 2; break;
        case '#': f.alternate = 1; break;
        case '0': if (f.pad != 0) f.pad = 2; break;
        default: flag = 0; break;
        }
        if (!flag) break;
        c = *++fmt;
    } while (1);
    if (c == '*') {
        f.width = *((*args += 1) - 1);
        if (f.width < 0) {
            f.pad = 0;
            f.width = -f.width;
        }
        c = *++fmt;
    } else {
        while (c < 0 || c >= 128 ? 0 : data_020c3754[c] & 8) {
            f.width = f.width * 10 + (c - '0');
            c = *++fmt;
        }
    }
    if (f.width > 509) {
        f.conversion = 255;
        *out = f;
        return fmt + 1;
    }
    if (c == '.') {
        c = *++fmt;
        f.precision = 1;
        if (c == '*') {
            f.digits = *((*args += 1) - 1);
            c = *++fmt;
            if (f.digits < 0) f.precision = 0;
        } else {
            while (c < 0 || c >= 128 ? 0 : data_020c3754[c] & 8) {
                f.digits = f.digits * 10 + (c - '0');
                c = *++fmt;
            }
        }
    }
    flag = 1;
    switch (c) {
    case 'h':
        f.length = 2;
        if (fmt[1] == 'h') { f.length = 1; c = *++fmt; }
        break;
    case 'l':
        f.length = 3;
        if (fmt[1] == 'l') { f.length = 4; c = *++fmt; }
        break;
    case 'L': f.length = 9; break;
    case 'j': f.length = 6; break;
    case 't': f.length = 8; break;
    case 'z': f.length = 7; break;
    default: flag = 0; break;
    }
    if (flag) c = *++fmt;
    f.conversion = c;
    switch (c) {
    case 'd': case 'i': case 'o': case 'u': case 'x': case 'X':
        if (f.length == 9) f.conversion = 255;
        else if (!f.precision) f.digits = 1;
        else if (f.pad == 2) f.pad = 1;
        break;
    case 'f': case 'F':
        if (f.length == 2 || f.length == 6 || f.length == 7 || f.length == 8 || f.length == 4) f.conversion = 255;
        else if (!f.precision) f.digits = 6;
        break;
    case 'a': case 'A':
        if (!f.precision) f.digits = 13;
        if (f.length == 2 || f.length == 6 || f.length == 7 || f.length == 8 || f.length == 4 || f.length == 1) f.conversion = 255;
        break;
    case 'g': case 'G':
        if (f.digits == 0) f.digits = 1;
    case 'e': case 'E':
        if (f.length == 2 || f.length == 6 || f.length == 7 || f.length == 8 || f.length == 4 || f.length == 1) f.conversion = 255;
        else if (!f.precision) f.digits = 6;
        break;
    case 'p':
        f.conversion = 'x'; f.alternate = 1; f.length = 3; f.digits = 8;
        break;
    case 'c':
        if (f.length == 3) f.length = 5;
        else if (f.precision || f.length != 0) f.conversion = 255;
        break;
    case 's':
        if (f.length == 3) f.length = 5;
        else if (f.length != 0) f.conversion = 255;
        break;
    case 'n': if (f.length == 9) f.conversion = 255; break;
    default: f.conversion = 255; break;
    }
    *out = f;
    return fmt + 1;
}




