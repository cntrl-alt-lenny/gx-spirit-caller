extern void func_ov002_0229cd88(void *self, unsigned int arg1);
extern void func_ov002_0229cdb8(void *self, unsigned int arg1);
extern unsigned char data_ov002_022ce288[];
extern unsigned char data_ov002_022d016c[];
extern int data_ov002_022cd73c[];
extern int data_ov002_022cd3f4;
extern unsigned char data_ov002_022cacbc[];
typedef union {
    unsigned int raw;
    struct { unsigned int p0:9; unsigned int b9:1; unsigned int p1:5; unsigned int b15:1; unsigned int b16:1; unsigned int p2:4; unsigned int b21:1; unsigned int p3:10; } b;
    struct { unsigned int p0:19; unsigned int kind:4; unsigned int p1:9; } k;
} Packed;
void func_ov002_022461d8(unsigned short *self) {
    int id = 0;
    int type;
    Packed p;
    *self = 0;
    if (*(int *)(data_ov002_022ce288 + 0x5d4) != 0) {
        type = data_ov002_022ce288[0x5dc];
        p.raw = *(unsigned int *)(data_ov002_022ce288 + 0x5fc);
        switch (type) {
        case 1: func_ov002_0229cd88(self,0x3e); break;
        case 2: func_ov002_0229cd88(self,0x3f); break;
        case 3: case 4: func_ov002_0229cd88(self,0x40); break;
        case 23:
            if (*(int *)(data_ov002_022d016c+0xcec) != data_ov002_022cd73c[1]) func_ov002_0229cd88(self,0x110);
            break;
        case 5:
            if (*(int *)(data_ov002_022d016c+0xcec) != data_ov002_022cd73c[1]) func_ov002_0229cd88(self,0xfb);
            else func_ov002_0229cd88(self,0x43);
            break;
        case 6: case 7: case 8: case 9: case 10: case 31: case 32: case 33: { Packed *q = &p;
            switch (type) {
            case 6: id=0xfc; break;
            case 7: id=0xfe; break;
            case 8: id=0x100; break;
            case 9: id=0xaf; break;
            case 10: id=0x9f; break;
            case 31: id=0xa9; break;
            case 32: id=0xab; break;
            case 33: id=0xad; break;
            }
            func_ov002_0229cd88(self,id + ((data_ov002_022cd73c[1]^1) == (q->b.b9 ^ q->b.b16)));
            break; }
        case 18:
            if (p.raw != 0) func_ov002_0229cd88(self,0xb6+(data_ov002_022cd3f4==(data_ov002_022cd73c[1]^1)));
            else func_ov002_0229cd88(self,0x9a);
            break;
        case 19: func_ov002_0229cd88(self,0xb5); break;
        case 20: func_ov002_0229cd88(self,0xb1); break;
        case 13: func_ov002_0229cd88(self,0x10a); break;
        case 14: func_ov002_0229cd88(self,0x105); break;
        case 15: func_ov002_0229cd88(self,0xb9+((data_ov002_022cd73c[1]^1)==p.b.b21)); break;
        case 22: func_ov002_0229cd88(self,0xb8); break;
        case 11: func_ov002_0229cd88(self,0xb2); break;
        case 12: func_ov002_0229cd88(self,0xb3); break;
        case 16: func_ov002_0229cd88(self,0xbd+((data_ov002_022cd73c[1]^1)==p.b.b16)); break;
        case 24: func_ov002_0229cd88(self,0xc4); break;
        case 25: func_ov002_0229cd88(self,0xc5+((data_ov002_022cd73c[1]^1)==p.b.b9)); break;
        case 27:
            if (p.b.b15) func_ov002_0229cd88(self,0x10b);
            else { switch (p.k.kind) {
                case 11: func_ov002_0229cd88(self,0xc7); break;
                case 14: func_ov002_0229cd88(self,0x10c); break;
            } }
            break;
        case 28: func_ov002_0229cd88(self,0xc8); break;
        case 29: func_ov002_0229cd88(self,0xc9+((data_ov002_022cd73c[1]^1)==p.b.b9)); break;
        case 30: func_ov002_0229cd88(self,0xcb); break;
        }
        if (*self != 0) func_ov002_0229cdb8(self,(unsigned int)data_ov002_022cacbc);
    }
    func_ov002_0229cdb8(self,0x10d);
}

