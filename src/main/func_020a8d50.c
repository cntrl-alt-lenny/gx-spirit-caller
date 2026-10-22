#define ARG(type) (ap += sizeof(type), *(type *)(ap - sizeof(type)))
typedef unsigned char u8;
typedef struct { u8 pad, sign, precision, alternate, length, conversion; int width, limit; } Format;
extern char data_02102a94[];
extern char *Strchr(char *, int);
extern int func_020aaddc(const char *);
extern char *func_020a7530(char *, char **, Format *);
extern char *func_020a7ac0(unsigned long, char *, Format);
extern char *func_020a7d0c(unsigned long long, char *, Format);
extern char *func_020a85ec(double, char *, Format);
extern char *func_020a7fec(double, char *, Format);
extern unsigned int func_020a72f0(char *, const unsigned short *, unsigned int);
extern void *func_020a73e8(u8 *, int, int);
int func_020a8d50(int (*write)(void *, const char *, int), void *context, char *fmt, char *ap) {
    char buffer[512];
    Format f;
    char padding = ' ';
    char space;
    long long wide;
    char *percent;
    int count;
    int error_count;
    int literal_count;
    long value;
    int size;
    char *text;
    int total = 0;
    double real;
    while (*fmt) {
        percent = Strchr(fmt, '%');
        if (!percent) {
            literal_count = func_020aaddc(fmt);
            total += literal_count;
            if (literal_count && !write(context, fmt, literal_count)) return -1;
            break;
        }
        literal_count = percent - fmt;
        total += literal_count;
        if (literal_count && !write(context, fmt, literal_count)) return -1;
        fmt = func_020a7530(percent, &ap, &f);
        switch (f.conversion) {
        case 'd': case 'i':
            if (f.length == 3) { value = ARG(long); }
            else if (f.length == 4) { wide = ARG(long long); }
            else if (f.length == 6) { wide = ARG(long long); }
            else if (f.length == 7) { value = ARG(long); }
            else if (f.length == 8) { value = ARG(long); }
            else { value = ARG(int); }
            if (f.length == 2) value = (short)value;
            if (f.length == 1) value = (signed char)value;
            if (f.length == 4 || f.length == 6) { text = func_020a7d0c(wide, buffer + 512, f); if (text) { size = buffer + 511 - text; } else goto invalid; }
            else { text = func_020a7ac0(value, buffer + 512, f); if (!text) goto invalid; }
            size = buffer + 511 - text;
            break;
        case 'o': case 'u': case 'x': case 'X':
            if (f.length == 3) { value = ARG(unsigned long); }
            else if (f.length == 4) { wide = ARG(unsigned long long); }
            else if (f.length == 6) { wide = ARG(unsigned long long); }
            else if (f.length == 7) { value = ARG(unsigned long); }
            else if (f.length == 8) { value = ARG(unsigned long); }
            else { value = ARG(unsigned int); }
            if (f.length == 2) value = (unsigned short)value;
            if (f.length == 1) value = (unsigned char)value;
            if (f.length == 4 || f.length == 6) { text = func_020a7d0c(wide, buffer + 512, f); if (text) { size = buffer + 511 - text; } else goto invalid; }
            else { text = func_020a7ac0(value, buffer + 512, f); if (!text) goto invalid; }
            size = buffer + 511 - text;
            break;
        case 'e': case 'E': case 'f': case 'F': case 'g': case 'G':
            if (f.length == 9) { real = ARG(long double); }
            else { real = ARG(double); }
            text = func_020a85ec(real, buffer + 512, f);
            if (!text) goto invalid;
            size = buffer + 511 - text;
            break;
        case 'a': case 'A':
            if (f.length == 9) { real = ARG(long double); }
            else { real = ARG(double); }
            text = func_020a7fec(real, buffer + 512, f);
            if (!text) goto invalid;
            size = buffer + 511 - text;
            break;
        case 's':
            if (f.length == 5) {
                const unsigned short *s = ARG(const unsigned short *);
                if ((int)func_020a72f0(buffer, s ? s : (const unsigned short *)(data_02102a94 + 4), 512) < 0) goto invalid;
                text = buffer;
            } else { text = ARG(char *); }
            if (!text) text = data_02102a94 + 8;
            if (f.alternate) {
                size = (unsigned char)*text++;
                if (f.precision && size > f.limit) size = f.limit;
            } else if (f.precision) {
                char *end;
                size = f.limit;
                end = func_020a73e8((u8 *)text, 0, size);
                if (end) size = end - text;
            } else size = func_020aaddc(text);
            break;
        case 'n': {
            void *p = ARG(void *);
            switch (f.length) {
            case 0: *(int *)p = total; break;
            case 2: *(short *)p = total; break;
            case 3: *(long *)p = total; break;
            case 6: *(long long *)p = total; break;
            case 7: *(long *)p = total; break;
            case 8: *(long *)p = total; break;
            case 4: *(long long *)p = total; break;
            }
            continue;
        }
        case 'c':
            buffer[0] = ARG(int);
            text = buffer; size = 1;
            break;
        case '%':
            buffer[0] = '%'; text = buffer; size = 1;
            break;
        case 255:
        default:
invalid:
            error_count = func_020aaddc(percent);
            if (error_count && !write(context, percent, error_count)) return -1;
            return total + error_count;
        }
        count = size;
        if (f.pad) {
            padding = f.pad == 2 ? '0' : ' ';
            if ((*text == '+' || *text == '-' || *text == ' ') && padding == '0') {
                if (!write(context, text, 1)) return -1;
                ++text; --size;
            }
            while (count < f.width) {
                if (!write(context, &padding, 1)) return -1;
                ++count;
            }
        }
        if (size && !write(context, text, size)) return -1;
        if (!f.pad) {
            while (count < f.width) {
                space = ' ';
                if (!write(context, &space, 1)) return -1;
                ++count;
            }
        }
        total += count;
    }
    return total;
}







