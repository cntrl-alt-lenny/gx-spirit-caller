/* func_020576bc: apply a fixed sequence of const/computed property
 * setters (func_02057ffc = constant-pointer value, func_02057fc4 =
 * computed value) onto a0's sub-object, sourcing some values from a1. */

extern void func_02057ffc(int a0, int a1, int a2);
extern void func_02057fc4(int a0, int a1, int a2);

extern int data_020fffa0;
extern int data_020ffea4;
extern int data_020fffac;
extern int data_020fffbc;
extern int data_020ffec0;

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

int func_020576bc(struct S02057730_A0 *a0, struct S02057730_A1 *a1) {
    struct S02057730_Sub *sub = a0->f_0;

    func_02057ffc((int)a0, (int)((unsigned char *)sub + 0x1f4), (int)&data_020fffa0);
    func_02057ffc((int)a0, (int)((unsigned char *)sub + 0x1f4), (int)&data_020ffea4);
    func_02057fc4((int)a0, (int)((unsigned char *)sub + 0x1f4), sub->f_198);
    func_02057ffc((int)a0, (int)((unsigned char *)sub + 0x1f4), (int)&data_020fffac);
    func_02057fc4((int)a0, (int)((unsigned char *)sub + 0x1f4), a1->f_0);
    func_02057ffc((int)a0, (int)((unsigned char *)sub + 0x1f4), (int)&data_020fffbc);
    func_02057ffc((int)a0, (int)((unsigned char *)sub + 0x1f4), a1->f_10);
    func_02057ffc((int)a0, (int)((unsigned char *)sub + 0x1f4), (int)&data_020ffec0);
    return 0;
}
