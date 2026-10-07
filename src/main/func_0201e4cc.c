/* func_0201e4cc: unpack a record into a descriptor and dispatch on its type. */
typedef struct {
    unsigned short t : 4;
    unsigned short pad0 : 1;
    unsigned short b5 : 2;
    unsigned short pad1 : 5;
    unsigned short b12 : 4;
} Flags14;

typedef struct {
    unsigned int pad : 17;
    unsigned int b17 : 7;
} Flags18;

typedef struct {
    char pad0[4];
    char *data;
    char pad1[4];
    int f0c;
    char pad2[2];
    unsigned short f12;
    unsigned short f14;
    unsigned short pad3;
    unsigned int f18;
} Desc;

typedef struct {
    char pad0[8];
    unsigned char f8;
    unsigned char f9;
    unsigned char fa;
    char padb;
    int f0c;
    char pad1[8];
    unsigned short f18;
    char pad2[2];
    int f1c;
    char data[1];
} Rec;

extern unsigned short func_020b3a7c(int a, int b);
extern void func_02092904(char *p, int n);
extern void func_0208fd90(char *p, int a, int b);
extern void func_0208fd30(char *p, int a, int b);

int func_0201e4cc(Desc *d, Rec *s) {
    int pad;
    char *data;

    data = s->data;
    pad = (s->f0c + 3) & ~3;

    if (s->f0c != 0) {
        d->data = data;
        d->f12 = func_020b3a7c(s->f0c, s->fa);
        ((Flags14 *)&d->f14)->b12 = s->f9;
        ((Flags14 *)&d->f14)->b5 = s->f8;
        ((Flags18 *)&d->f18)->b17 = s->f18;
    }
    if (d->f0c != -1 && s->f1c != 0) {
        func_02092904(data + pad, s->f1c);
        switch (((Flags14 *)&d->f14)->t) {
        case 4:
            func_0208fd90(data + pad, d->f0c, s->f1c);
            break;
        case 9:
            func_0208fd30(data + pad, d->f0c, s->f1c);
            break;
        }
    }
    return 0;
}
