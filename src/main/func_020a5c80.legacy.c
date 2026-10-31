typedef struct {
    unsigned char mode;
    unsigned char pad;
    unsigned short first;
    unsigned short second;
} Src020a5c80;

unsigned char *func_020a5c80(Src020a5c80 *src, unsigned char *dst) {
    unsigned char *out = dst;
    unsigned char mode = src->mode;
    out++;
    *dst = mode;
    switch (src->mode) {
    case 1:
    case 2:
    case 3:
    case 5:
    case 6:
        break;
    case 4:
        *out++ = src->first;
        *out++ = (src->first & 0xff00) >> 8;
        *out++ = src->second;
        *out++ = (src->second & 0xff00) >> 8;
        break;
    default:
        return 0;
    }
    return out;
}


