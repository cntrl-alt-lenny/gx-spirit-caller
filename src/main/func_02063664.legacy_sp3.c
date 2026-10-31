typedef struct Self020619b8 Self020619b8;
typedef void (*Cb020619b8)(Self020619b8 *, int);
struct Self020619b8 {
    unsigned char pad[0x34];
    Cb020619b8 f34;
};
extern int func_02055330(void);
extern int func_020619b8(Self020619b8 *self, int arg1);
extern int func_020a7440(unsigned char *p0, unsigned char *p1, int count);
extern unsigned char data_02101534[];
extern void *__memcpy(void *dest, const void *src, unsigned long size);

int func_02063664(Self020619b8 *self, unsigned char *p, int len) {
    int value;
    if (self->f34 == 0) return 1;
    if (len != 8) return 1;
    if (func_020a7440(p, data_02101534, 4) != 0) return 1;
    __memcpy(&value, p + 4, 4);
    return func_020619b8(self, func_02055330() - value) != 0;
}

