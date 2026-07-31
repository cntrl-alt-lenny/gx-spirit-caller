/* func_0201d778: gate on arg0->field10/an embedded 3-bit signed field
 * of arg0->field18, resolve a count (arg0->field20, or arg1->field8*2
 * as a fallback), forward it to func_02092904(&arg1[0xc], count), then
 * dispatch on arg0->field14's low 4-bit "kind" bitfield into 4 near-
 * identical groups -- each checks the field14 bit-4 flag: if SET, a
 * 3-call sequence (middle call gets an extra hibits<<13 term added to
 * pos); if CLEAR, a single fallback call.
 */
extern void func_0208f1c4(void);
extern void func_0208f210(void *a, int b, int c);
extern void func_0208f284(void);
extern void func_0208f2a8(void);
extern void func_0208f2f4(void *a, int b, int c);
extern void func_0208f368(void);
extern void func_0208f38c(void);
extern void func_0208f3e4(void *a, int b, int c);
extern void func_0208f458(void);
extern void func_0208f4c8(void);
extern void func_0208f52c(void *a, int b, int c);
extern void func_0208f5ac(void);
extern void func_0208feb4(void *a, int b, int c);
extern void func_0208ff1c(void *a, int b, int c);
extern void func_0208ff84(void *a, int b, int c);
extern void func_0208ffec(void *a, int b, int c);
extern void func_02092904(void *a, int b);

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

int func_0201d778(struct F0201d778 *arg0, char *arg1)
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

    func_02092904(arg1 + 0xc, count);

    switch (arg0->field14.kind) {
    case 4:
        if (arg0->field14.flag4 != 0) {
            func_0208f458();
            func_0208f3e4(arg1 + 0xc, arg0->field10 + (hibits << 13), count);
            func_0208f38c();
        } else {
            func_0208ff1c(arg1 + 0xc, arg0->field10, count);
        }
        break;
    case 9:
        if (arg0->field14.flag4 != 0) {
            func_0208f284();
            func_0208f210(arg1 + 0xc, arg0->field10 + (hibits << 13), count);
            func_0208f1c4();
        } else {
            func_0208feb4(arg1 + 0xc, arg0->field10, count);
        }
        break;
    case 0:
    case 1:
    case 2:
    case 3:
        if (arg0->field14.flag4 != 0) {
            func_0208f5ac();
            func_0208f52c(arg1 + 0xc, arg0->field10 + (hibits << 13), count);
            func_0208f4c8();
        } else {
            func_0208ffec(arg1 + 0xc, arg0->field10, count);
        }
        break;
    case 5:
    case 6:
    case 7:
    case 8:
        if (arg0->field14.flag4 != 0) {
            func_0208f368();
            func_0208f2f4(arg1 + 0xc, arg0->field10 + (hibits << 13), count);
            func_0208f2a8();
        } else {
            func_0208ff84(arg1 + 0xc, arg0->field10, count);
        }
        break;
    default:
        break;
    }

    return 0;
}
