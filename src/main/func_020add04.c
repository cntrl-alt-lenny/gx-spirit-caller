typedef struct {
    unsigned char sign;
    short exponent;
    unsigned char length;
    signed char digits[1];
} Decimal;

void func_020add04(Decimal *value, int n) {
    signed char *base, *p, *end;
    signed char digit;
    int carry;
    if (n < 0) {
reset_to_zero:
        value->exponent = 0;
        value->length = 1;
        value->digits[0] = '0';
        return;
    }
    if (n >= value->length) return;
    base = value->digits;
    p = base + n + 1;
    digit = *--p - '0';
    if (digit == 5) {
        end = base + value->length;
        do {
            --end;
        } while (end > p && *end == '0');
        if (end == p) carry = p[-1] & 1;
        else carry = 1;
    } else {
        carry = digit > 5;
    }
    while (n != 0) {
        digit = *--p - '0' + carry;
        carry = digit > 9;
        if (carry != 0 || digit == 0) {
            --n;
        } else {
            *p = digit + '0';
            break;
        }
    }
    if (carry != 0) {
        value->exponent++;
        value->length = 1;
        value->digits[0] = '1';
        return;
    }
    /* Both zero-result paths share the reset and return. */
    if (n == 0) goto reset_to_zero;
    value->length = n;
}
