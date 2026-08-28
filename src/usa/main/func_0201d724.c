/* func_0201d724: gate on arg0->field10/an embedded 3-bit signed field
 * of arg0->field18, resolve a count (arg0->field20, or arg1->field8*2
 * as a fallback), forward it to func_0209281c(&arg1[0xc], count), then
 * dispatch on arg0->field14's low 4-bit "kind" bitfield into 4 near-
 * identical groups -- each checks the field14 bit-4 flag: if SET, a
 * 3-call sequence (middle call gets an extra hibits<<13 term added to
 * pos); if CLEAR, a single fallback call.
 */
extern void func_0208f0dc(void);
extern void func_0208f128(void *a, int b, int c);
extern void func_0208f19c(void);
extern void func_0208f1c0(void);
extern void func_0208f20c(void *a, int b, int c);
extern void func_0208f280(void);
extern void func_0208f2a4(void);
extern void func_0208f2fc(void *a, int b, int c);
extern void func_0208f370(void);
extern void func_0208f3e0(void);
extern void func_0208f444(void *a, int b, int c);
extern void func_0208f4c4(void);
extern void func_0208fdcc(void *a, int b, int c);
extern void func_0208fe34(void *a, int b, int c);
extern void func_0208fe9c(void *a, int b, int c);
extern void func_0208ff04(void *a, int b, int c);
extern void func_0209281c(void *a, int b);

struct F14Bits {
    unsigned short kind : 4;
    unsigned short flag4 : 1;
    unsigned short rest : 11;
};

struct F0201d778 {
    char _pad0[0x10];
    short field10;          /* 0x10 */
    char _pad1[2];
    struct F14Bits field14;  /* 0x14 */
    char _pad2[2];
    int field18;               /* 0x18 */
    char _pad3[4];
    int field20;                  /* 0x20 */
};

int func_0201d724(struct F0201d778 *arg0, char *arg1)
{
    int count;
    int hibits;

    if (arg0->field20 == 0) {
        count = *(int *)(arg1 + 8) << 1;
    } else {
        count = arg0->field20;
    }
    hibits = (arg0->field18 << 15) >> 29;

    if (arg0->field10 < 0 || hibits < 0) {
        return 0;
    }
    if (count == 0) {
        return 0;
    }

    func_0209281c(arg1 + 0xc, count);

    switch (arg0->field14.kind) {
    case 4:
        if (arg0->field14.flag4 != 0) {
            func_0208f370();
            func_0208f2fc(arg1 + 0xc, arg0->field10 + (hibits << 13), count);
            func_0208f2a4();
        } else {
            func_0208fe34(arg1 + 0xc, arg0->field10, count);
        }
        break;
    case 9:
        if (arg0->field14.flag4 != 0) {
            func_0208f19c();
            func_0208f128(arg1 + 0xc, arg0->field10 + (hibits << 13), count);
            func_0208f0dc();
        } else {
            func_0208fdcc(arg1 + 0xc, arg0->field10, count);
        }
        break;
    case 0:
    case 1:
    case 2:
    case 3:
        if (arg0->field14.flag4 != 0) {
            func_0208f4c4();
            func_0208f444(arg1 + 0xc, arg0->field10 + (hibits << 13), count);
            func_0208f3e0();
        } else {
            func_0208ff04(arg1 + 0xc, arg0->field10, count);
        }
        break;
    case 5:
    case 6:
    case 7:
    case 8:
        if (arg0->field14.flag4 != 0) {
            func_0208f280();
            func_0208f20c(arg1 + 0xc, arg0->field10 + (hibits << 13), count);
            func_0208f1c0();
        } else {
            func_0208fe9c(arg1 + 0xc, arg0->field10, count);
        }
        break;
    default:
        break;
    }

    return 0;
}
