/* func_02057730: apply a fixed sequence of const/computed property
 * setters (func_02058070 = constant-pointer value, func_02058038 =
 * computed value) onto a0's sub-object, sourcing some values from a1. */

extern void func_02058070(int a0, int a1, int a2);
extern void func_02058038(int a0, int a1, int a2);

extern int data_02100080;
extern int data_020fff84;
extern int data_0210008c;
extern int data_0210009c;
extern int data_020fffa0;

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
    int f_10;                       /* +0x10 */
};

int func_02057730(struct S02057730_A0 *a0, struct S02057730_A1 *a1) {
    struct S02057730_Sub *sub = a0->f_0;

    func_02058070((int)a0, (int)((unsigned char *)sub + 0x1f4), (int)&data_02100080);
    func_02058070((int)a0, (int)((unsigned char *)sub + 0x1f4), (int)&data_020fff84);
    func_02058038((int)a0, (int)((unsigned char *)sub + 0x1f4), sub->f_198);
    func_02058070((int)a0, (int)((unsigned char *)sub + 0x1f4), (int)&data_0210008c);
    func_02058038((int)a0, (int)((unsigned char *)sub + 0x1f4), a1->f_0);
    func_02058070((int)a0, (int)((unsigned char *)sub + 0x1f4), (int)&data_0210009c);
    func_02058070((int)a0, (int)((unsigned char *)sub + 0x1f4), a1->f_10);
    func_02058070((int)a0, (int)((unsigned char *)sub + 0x1f4), (int)&data_020fffa0);
    return 0;
}
