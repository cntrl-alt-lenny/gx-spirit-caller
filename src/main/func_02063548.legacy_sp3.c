extern int func_02063808(void *self, int p1, int p2);
extern int func_0206371c(void *self, unsigned char *p, int len);
extern int func_02063710(void *self, unsigned char *p, int len);
extern int func_02063664(void *self, unsigned char *p, int len);
extern int func_02063620(void *self);

int func_02063548(void *o, int kind, unsigned char *p, int len) {
    unsigned char *body = p + 3;
    int n = len - 3;

    if (kind == 0x64) {
        if (func_02063808(o, (int)body, n) == 0) {
            return 0;
        }
    } else if (kind == 0x65) {
        if (func_0206371c(o, body, n) == 0) {
            return 0;
        }
    } else if (kind == 0x66) {
        if (func_02063710(o, p, len) == 0) {
            return 0;
        }
    } else if (kind == 0x67) {
        if (func_02063664(o, body, n) == 0) {
            return 0;
        }
    } else if (kind == 0x68) {
        if (func_02063620(o) == 0) {
            return 0;
        }
    }
    return 1;
}
