/* func_ov011_021d1e14: if a==0x12 return a. Else if a>0x12, a 22-entry
 * dense jump table over [0x2b,0x40] where most entries return a
 * verbatim, a minority fall to func_02013948(b)+a. Else (a<0x12) also
 * func_02013948(b)+a. The a==0x12 case's "return a" is a SHARED tail
 * with the switch's matching cases (one merged block), not a separate
 * early return - reached via goto from both places. */
extern int func_02013948(int b);

int func_ov011_021d1e14(int a, int b)
{
    if (a > 0x12)
        goto hi;
    if (a != 0x12)
        goto lo;
    goto ret_a;

hi:
    switch (a) {
    case 0x2b:
    case 0x2c:
    case 0x2d:
    case 0x2e:
    case 0x2f:
    case 0x30:
    case 0x35:
    case 0x3a:
    case 0x3b:
    case 0x3c:
    case 0x3d:
    case 0x3e:
    case 0x3f:
    case 0x40:
        goto ret_a;
    }
    goto lo;

ret_a:
    return a;

lo:
    return func_02013948(b) + a;
}
