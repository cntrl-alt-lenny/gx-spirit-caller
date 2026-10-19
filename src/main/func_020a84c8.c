typedef struct {
    unsigned char sign;
    short exponent;
    unsigned char length;
    signed char digits[32];
} Decimal;

void func_020a84c8(Decimal *d, int n)
{
    signed char *p;
    signed char *end;
    signed char digit;
    int carry;
    if (n < 0) {
zero:
        d->exponent = 0;
        d->length = 1;
        d->digits[0] = '0';
        return;
    }
    if (n >= d->length) return;
    end = d->digits;
    p = end + n + 1;
    digit = *--p - '0';
    if (digit == 5) {
        end += d->length;
        do {
            --end;
            if (end <= p) break;
        } while (*end == '0');
        if (end == p) carry = p[-1] & 1;
        else carry = 1;
    } else {
        carry = digit > 5;
    }
    while (n != 0) {
        digit = *--p - '0' + carry;
        carry = digit > 9;
        if (carry || digit == 0) {
            --n;
        } else {
            *p = digit + '0';
            break;
        }
    }
    if (carry) {
        ++d->exponent;
        d->length = 1;
        d->digits[0] = '1';
    } else if (n == 0) {
        goto zero;
    } else {
        d->length = n;
    }
}



