typedef struct Obj Obj;
struct Obj {
    char pad0[0xc];
    int f0c;
    char pad10[0x10];
    int f20;
    char pad24[8];
    int f2c;
};
extern int data_02101530;
extern int *func_02064d10(void *p, int a, short b);
extern int func_02061670(Obj *self, int *other, int a, int b, int c, int d, int e, int mode);
extern int func_02061578(Obj *self, int a, int b, int c, int d, int *out);
extern int func_02062438(Obj *a, int **pp, int b, int c);
extern int func_020628b0(int a, int b, short c);
extern int func_020628fc(int *p);
extern int func_02064208(int *o, int a, int b);
/* original passes only the first argument; no parameter list on purpose */
extern int func_020643d8();
extern int func_02063854(int *self, int type, int data, int len);
extern int func_02063548(int *o, int kind, unsigned char *p, int len);
extern int func_020a7440(void *a, void *b, int n);

int func_02063288(Obj *self, unsigned char *data, int len, int a, short b) {
    int *entry;
    int out;
    int flag;
    int *e;
    int kind;

    entry = func_02064d10(self, a, b);
    if (self->f2c != 0) {
        if (func_02061670(self, entry, a, b, 0, (int)data, len, 0) == 0) {
            return 0;
        }
    }
    if (len > 2 && func_020a7440(data, &data_02101530, 2) == 0) {
        flag = 1;
    } else {
        flag = 0;
    }
    if (entry == 0) {
        if (func_02061578(self, a, b, (int)data, len, &out) == 0) {
            return 0;
        }
        if (out != 0) {
            return 1;
        }
        if (flag == 0 || data[2] != 1) {
            if (flag == 0 || data[2] != 0x68) {
                if (func_020628b0((int)self, a, b) == 0) {
                    return 0;
                }
            }
            return 1;
        }
        if (self->f20 == 0) {
            return 1;
        }
        {
            int r = func_02062438(self, &entry, a, b);
            if (r != 0) {
                if (r != 5) {
                    if (func_020628b0((int)self, a, b) == 0) {
                        return 0;
                    }
                }
                return 1;
            }
        }
    }
    e = entry;
    if (e[3] == 7) {
        if (flag == 0 || data[2] != 0x68) {
            if (func_020628fc(e) == 0) {
                return 0;
            }
        }
        return 1;
    }
    if (flag != 0 && len >= 4) {
        if (func_020a7440(data + 2, &data_02101530, 2) == 0) {
            data += 2;
            len -= 2;
            flag = 0;
        }
    }
    if (flag == 0) {
        if (func_02064208(e, (int)data, len) != 0) return 1;
        return 0;
    }
    kind = data[2];
    if (kind < 0) {
        if (func_020643d8(e) != 0) return 1;
        return 0;
    }
    if (kind < 8) {
        if (func_02063854(e, kind, (int)data, len) != 0) return 1;
        return 0;
    }
    if (func_02063548(e, kind, data, len) != 0) return 1;
    return 0;
}
