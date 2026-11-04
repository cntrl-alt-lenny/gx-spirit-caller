typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned long long u64;

typedef struct {
    u8 flag;
    u8 pad1;
    u16 last;
    u8 len;
    u8 digits[16];
} DigitBuf;

extern u64 func_020b3808(u64 a, u64 b);
extern u64 func_020b3814(u64 a, u64 b);

void func_020b048c(DigitBuf *buf, u64 value)
{
    u8 *lo;
    u8 *hi;
    u8 t;

    buf->flag = 0;
    buf->len = 0;
    while (value != 0) {
        u8 i = buf->len++;
        buf->digits[i] = (u8)func_020b3814(value, 10);
        value = func_020b3808(value, 10);
    }
    lo = buf->digits;
    hi = lo + buf->len - 1;
    while (lo < hi) {
        t = *lo;
        *lo++ = *hi;
        *hi-- = t;
    }
    buf->last = buf->len - 1;
}
