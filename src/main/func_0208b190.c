#pragma thumb on

typedef struct {
    int f0;   /* +0x00 */
    int f4;   /* +0x04 */
    int f8;   /* +0x08 */
    int fc;   /* +0x0c */
    int f10;  /* +0x10 */
    int f14;  /* +0x14 */
    int f18;  /* +0x18 */
    int f1c;  /* +0x1c */
    int f20;  /* +0x20 */
} S0208b190;

void func_0208b190(S0208b190 *p, int b, int a) {
    p->f0 = 0x1000;
    p->f4 = 0;
    p->f8 = 0;
    p->fc = 0;
    p->f10 = a;
    p->f14 = b;
    p->f18 = 0;
    p->f1c = -b;
    p->f20 = a;
}

#pragma thumb reset
