/* func_02057730: apply a fixed sequence of const/computed property
 * setters (func_02058070 = constant-pointer value, func_02058038 =
 * computed value) onto a0's sub-object, sourcing some values from a1. */

extern int func_02058070(void *ctx, void *buf, char *s);
extern void func_02058038(void *a0, void *a1, int a2);

extern char data_02100080[];
extern char data_020fff84[];
extern char data_0210008c[];
extern char data_0210009c[];
extern char data_020fffa0[];

struct S02057730_Sub {
    unsigned char _pad_00[0x198];
    int f_198;   /* +0x198 */
};

struct S02057730_A0 {
    struct S02057730_Sub *f_0;   /* +0x0 */
};

struct S02057730_A1 {
    int f_0;                     /* +0x0 */
    unsigned char _pad_4[0x10 - 0x4];
    char *f_10;                     /* +0x10 */
};

int func_02057730(struct S02057730_A0 *a0, struct S02057730_A1 *a1) {
    struct S02057730_Sub *sub = a0->f_0;

    func_02058070(a0, (unsigned char *)sub + 0x1f4, data_02100080);
    func_02058070(a0, (unsigned char *)sub + 0x1f4, data_020fff84);
    func_02058038(a0, (unsigned char *)sub + 0x1f4, sub->f_198);
    func_02058070(a0, (unsigned char *)sub + 0x1f4, data_0210008c);
    func_02058038(a0, (unsigned char *)sub + 0x1f4, a1->f_0);
    func_02058070(a0, (unsigned char *)sub + 0x1f4, data_0210009c);
    func_02058070(a0, (unsigned char *)sub + 0x1f4, a1->f_10);
    func_02058070(a0, (unsigned char *)sub + 0x1f4, data_020fffa0);
    return 0;
}
