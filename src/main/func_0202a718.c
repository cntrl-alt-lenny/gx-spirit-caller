typedef unsigned short u16;
typedef struct {
    char pad0[0x68];
    int x68, x6c, x70;
    int x74, x78, x7c, x80, x84, x88;
    int x8c, x90, x94;
    char pad98[0x40];
    int mode;
    short window;
    char padde[4];
    short engine;
    u16 a, b;
    short blend;
    u16 enabled : 1;
    u16 visible : 1;
} Obj;
extern void func_0208c884(u16 *a0, int a1);
extern int func_0202abdc(Obj *o);
extern void func_0208e318(int *out, int a, int b, int c, int d);
extern void func_0208e29c(u16 *ptr, int a, int b, int c, int d, int brightness);
int func_0202a718(Obj *o) {
    if (o->enabled) {
        switch (o->mode) {
        case 1:
            func_0208c884((u16 *)0x0400006c, (short)(o->x68 >> 4));
            func_0208c884((u16 *)0x0400106c, (short)(o->x6c >> 4));
            break;
        case 2: {
            int x0 = o->x74 >> 4;
            int y0 = o->x78 >> 4;
            int x1 = o->x80 >> 4;
            int y1 = o->x84 >> 4;
            switch (o->window) {
            case 0:
                *(u16 *)0x04000040 = ((x0 << 8) & 0xff00) | (x1 & 0xff);
                *(u16 *)0x04000044 = ((y0 << 8) & 0xff00) | (y1 & 0xff);
                break;
            case 1:
                *(u16 *)0x04000042 = ((x0 << 8) & 0xff00) | (x1 & 0xff);
                *(u16 *)0x04000046 = ((y0 << 8) & 0xff00) | (y1 & 0xff);
                break;
            case 2:
                *(u16 *)0x04001040 = ((x0 << 8) & 0xff00) | (x1 & 0xff);
                *(u16 *)0x04001044 = ((y0 << 8) & 0xff00) | (y1 & 0xff);
                break;
            case 3:
                *(u16 *)0x04001042 = ((x0 << 8) & 0xff00) | (x1 & 0xff);
                *(u16 *)0x04001046 = ((y0 << 8) & 0xff00) | (y1 & 0xff);
                break;
            }
            if ((x0 <= 0 && x1 >= 256) || x0 >= x1 || y0 >= y1)
                o->visible = 0;
            else
                o->visible = 1;
            func_0202abdc(o);
            break;
        }
        case 3: {
            int c = o->x8c >> 4;
            int d = o->x90 >> 4;
            int brightness = o->x94 >> 4;
            int a = o->a;
            int b = o->b;
            switch (o->engine) {
            case 0:
                switch (o->blend) {
                case 0: func_0208e318((int *)0x04000050, a, b, c, d); break;
                case 1: func_0208e29c((u16 *)0x04000050, a, b, c, d, brightness); break;
                }
                break;
            case 1:
                switch (o->blend) {
                case 0: func_0208e318((int *)0x04001050, a, b, c, d); break;
                case 1: func_0208e29c((u16 *)0x04001050, a, b, c, d, brightness); break;
                }
                break;
            }
            break;
        }
        }
    }
    return 1;
}
