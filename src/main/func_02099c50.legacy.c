typedef struct { short x, y; unsigned short touch, extra; } Touch;
extern char data_021a8394[];
extern int data_021a83ac[];
void func_02099c50(Touch *dst, const Touch *src) {
    if (*(unsigned short *)(data_021a8394 + 0x30) == 0) {
        *dst = *src;
        return;
    }
    { int *cal = data_021a83ac;
    dst->touch = src->touch;
    dst->extra = src->extra;
    if (src->touch == 0) {
        dst->x = 0;
        dst->y = 0;
        return;
    }
    dst->x = (((long long)((unsigned short)src->x * 4) - cal[0]) * cal[2]) >> 22;
    if (dst->x < 0) dst->x = 0;
    else if (dst->x > 255) dst->x = 255;
    dst->y = (((long long)((unsigned short)src->y * 4) - cal[3]) * cal[5]) >> 22;
    if (dst->y < 0) dst->y = 0;
    else if (dst->y > 191) dst->y = 191;
    }
}

