typedef struct { char pad[0xb4]; int f_b4; } Obj;
typedef struct { char data[0x2c]; } Record;
extern int func_ov002_0229e14c(Obj *self);
extern int func_ov002_0229d2c8(void *arg0);
extern int func_ov002_0229e814(void *arg0);
int func_ov002_022a6d1c(char *base) {
    int i,j;
    char *p=base+0x3e0;
    char *a;
    Record *b;
    for(i=0;i<2;i++,p+=0xcc) {
        if(func_ov002_0229e14c((Obj *)p)) return 1;
    }
    a=base+0x1b8;
    b=(Record *)(base+0x280);
    for(i=0;i<2;i++,a+=0x64,base+=0xdc,b+=4) {
        j=0;
        p=a;
        for(;j<5;j++,p+=0x14) {
            if(func_ov002_0229d2c8(p)) return 1;
        }
        j=0;
        p=base;
        for(;j<=10;j++,p+=0x14) {
            if(func_ov002_0229d2c8(p)) return 1;
        }
        for(j=12;j<=15;j++) {
            if(func_ov002_0229e814(&b[j-12])) return 1;
        }
    }
    return 0;
}

