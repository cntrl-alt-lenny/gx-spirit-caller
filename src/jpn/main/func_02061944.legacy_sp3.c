typedef struct {
    char _pad_14[0x14];
    int f14;              /* +0x14 */
    char _pad_18[0x1c - 0x18];
    int f1c;              /* +0x1c */
} SubObj020619b8;

typedef struct Self020619b8 Self020619b8;
typedef void (*Cb020619b8)(Self020619b8 *, int);

struct Self020619b8 {
    char _pad_08[0x8];
    SubObj020619b8 *f8;    /* +0x8 */
    char _pad_24[0x24 - 0xc];
    int f24;                 /* +0x24 */
    char _pad_34[0x34 - 0x28];
    Cb020619b8 f34;            /* +0x34 */
};

extern void func_020a6c60(const char *file, const char *msg, int zero, int line);
extern void func_02064a2c(SubObj020619b8 *self);

extern char data_02101404[];
extern char data_02101414[];

int func_02061944(Self020619b8 *self, int arg1) {
    if (self == 0) {
        func_020a6c60(data_02101414, data_02101404, 0, 0xd9);
    }
    if (self == 0) return 1;

    if (self->f34 == 0) return 1;

    self->f24 += 1;
    self->f8->f1c += 1;

    self->f34(self, arg1);

    self->f24 -= 1;
    self->f8->f1c -= 1;

    if (self->f8->f14 == 0) goto L_a78;
    if (self->f8->f1c != 0) goto L_a78;

    func_02064a2c(self->f8);
    return 0;
L_a78:
    return 1;
}
