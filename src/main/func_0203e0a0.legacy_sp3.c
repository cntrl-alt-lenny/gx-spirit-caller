extern char data_020bec3c[];
extern char data_020fe4c4[];

typedef struct Ent {
    unsigned char pad0;
    unsigned char b1;
    unsigned char pad2;
    unsigned char b3;
    unsigned char data[0x20];
} Ent;

typedef struct Obj {
    char pad[0x300];
    Ent ents[0x40];
    char pad2[0x10c];
    unsigned char lo:4;
    unsigned char hi:4;
} Obj;

extern int func_0203df88(Obj *p);
extern void func_02094688(const void *src, void *dst, unsigned int size);

unsigned int func_0203e0a0(Obj *p)
{
    unsigned int n;
    Ent *e = p->ents;
    n = func_0203df88(p);
    e += n;
    if (p->lo == 0 || p->lo == 4) {
        func_02094688(data_020fe4c4, e->data, 8);
        e->b3 = 8;
        e->b1 = 6;
        n = (n + 1) & 0xff;
        e++;
    }
    if (p->lo == 0 || p->lo == 7) {
        func_02094688(data_020bec3c, e->data, 8);
        e->b3 = 8;
        e->b1 = 9;
        n = (n + 1) & 0xff;
        e++;
    }
    if (p->lo == 0 || p->lo == 8) {
        func_02094688(data_020bec3c + 0x10, e->data, 0xb);
        e->b3 = 0xb;
        e->b1 = 0xa;
        n = (n + 1) & 0xff;
    }
    return n;
}
