typedef struct Obj Obj;
typedef void (*Callback)(Obj *, Obj *, int, int, int, int, int);
struct Obj { int f0; char pad4[8]; int f0c, f10, f14, f18, f1c, f20, f24; Callback f28, f2c; };
typedef struct { unsigned char len, family; unsigned short port; unsigned int addr; } SockAddr;
extern void *func_02054bfc(int unused0);
extern int func_02054ca8(int sock, void *buf, int len, int flags, SockAddr *to, int tolen);
extern int func_02054fd0(int a0);
extern int func_02061670(Obj *self, Obj *other, int a, int b, int c, int d, int e, int mode);
extern int func_02063188(Obj *o, int a, short b);
extern void func_020644c4(void *a0);
extern int *func_02064d10(void *p, int a, short b);
extern void func_02064db0(char **str, int *len);
int func_020645e0(Obj *self, int addr, short port, char *buf, int len) {

    int err;
    func_02064db0(&buf, &len);
    if (func_02054fd0(self->f0) == 0) return 1;
    { SockAddr sa = {0};
    sa.family = 2;
    sa.port = ((port >> 8) & 0xff) | ((port << 8) & 0xff00);
    sa.addr = addr;
    if (func_02054ca8(self->f0, buf, len, 0, &sa, 8) == -1) {
        err = (int)func_02054bfc(self->f0);
        if (err == -15) {
            if (func_02063188(self, addr, port) == 0) return 0;
        } else if (err == -42 || err == -6) {
            return 1;
        } else if (err != -35) {
            func_020644c4(self);
            return 0;
        }
    } else if (self->f28 != 0) {
        if (func_02061670(self, (Obj *)func_02064d10(self, addr, port), addr, port, 0, (int)buf, len, 1) == 0) return 0;
    }
    return 1;
    }
}



