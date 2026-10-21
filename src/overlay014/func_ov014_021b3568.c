typedef struct { unsigned short x,y; unsigned char w,h; } Rect;
typedef struct { int f0,f4,f8,fc,f10; } SelfT;
extern unsigned short data_02104bac[];
extern Rect data_ov014_021b4d48[];
extern SelfT data_ov014_0223515c;
extern int func_02037208(int,int,int,int);
extern int Ov014_HitTestSecondary(int a0, Rect *r);
extern int func_ov014_021b379c(char *self);
/* The existing C definition takes void; this original caller passes the dialog pointer. */
extern int func_ov014_021b4810(SelfT *self);
extern int func_ov014_021b484c(SelfT *self);
extern int func_ov014_021b4ac4(SelfT *self);
int func_ov014_021b3568(char *self) {
    int i;
    Rect *r;
    switch (*(int *)(self+4)) {
    case 0:
        if (data_02104bac[0x29]) {
            unsigned int keys = data_02104bac[0x2a];
            if (keys & 1) return func_ov014_021b379c(self);
            else if (keys & 0x40) {
                switch (*(int *)(self+0x34)) {
                case 0: if (*(signed char *)(self+0xc)==0) *(int *)(self+0x34)=2; else *(int *)(self+0x34)=3; break;
                case 1: case 2: case 3: --*(int *)(self+0x34); break;
                }
                func_02037208(0x38,-1,0,1);
            } else if (keys & 0x80) {
                switch (*(int *)(self+0x34)) {
                case 0: case 1: ++*(int *)(self+0x34); break;
                case 2: if (*(signed char *)(self+0xc)==0) *(int *)(self+0x34)=0; else *(int *)(self+0x34)=3; break;
                case 3: *(int *)(self+0x34)=0; break;
                }
                func_02037208(0x38,-1,0,1);
            } else if (keys & 0x30) {
                if (*(int *)(self+0x34)!=1 && *(int *)(self+0x34)!=2) break; {
                    *(int *)(self+0x30)=1-*(int *)(self+0x30);
                    func_02037208(0x38,-1,0,1);
                }
            } else if ((keys & 8) && *(signed char *)(self+0xc)) {
                if (*(int *)(self+0x34)<3) {
                    *(int *)(self+0x34)=3;
                    func_02037208(0x38,-1,0,1);
                }
            }
        } else {
            r=data_ov014_021b4d48;
            for (i=0;i<6;i++,r+=2) {
                if (Ov014_HitTestSecondary((int)self,r)) return func_ov014_021b379c(self);
            }
        }
        break;
    case 1:
        if (func_ov014_021b484c(&data_ov014_0223515c)) *(int *)(self+4)=2;
        func_ov014_021b4ac4(&data_ov014_0223515c);
        break;
    case 2:
        if (func_ov014_021b4810(&data_ov014_0223515c)) {
            if (1 - data_ov014_0223515c.f8) return 1;
            *(int *)(self+4)=0;
        }
        break;
    }
    return 0;
}




