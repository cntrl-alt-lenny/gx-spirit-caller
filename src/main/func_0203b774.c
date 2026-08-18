typedef struct {
    char _pad_00[0x78];
    char *field_78;
    char _pad_7c[0xbf - 0x7c];
    unsigned char byte_bf;
} self_t;

extern int func_0203b158(self_t *self, int a2);
extern int func_0203b3b8(self_t *self, int a1, int a2);
extern void func_0203b6b4(self_t *self, void *p);
extern int func_0203af58(self_t *self, int a1, int a2);
extern void func_0203af44(void *p);

int func_0203b774(self_t *self, int a1, int a2) {
    void *p = self->field_78 + (a2 << 5);

    if (self->byte_bf != 0) {
        for (;;) {
            if (func_0203b158(self, a2) == 0) {
                return 0;
            }
            if (func_0203b3b8(self, a1, a2) != 0) {
                func_0203b6b4(self, p);
                return 1;
            }
            if (a2 == 0) {
                return 0;
            }
        }
    } else {
        for (;;) {
            if (func_0203af58(self, a1, a2) != 0) {
                break;
            }
            if (a2 == 0) {
                return 0;
            }
        }
        func_0203af44(p);
        func_0203b6b4(self, p);
        return 1;
    }
}
