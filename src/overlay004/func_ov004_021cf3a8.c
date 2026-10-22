typedef struct { int scale; int mode; int unused[2]; void *entry; } Record;
typedef struct { unsigned int a,b; unsigned char pad8[0x14]; struct { unsigned int low8:8; unsigned int:24; }; unsigned char pad20[4]; struct { unsigned int:17; unsigned int mid4:4; unsigned int:11; }; } state_t;
extern char data_ov004_0220b500[];
extern state_t data_02102c90;
extern void func_ov004_021ca0a4(Record *, int, int, int, void *, int);
extern int func_ov004_021ceb6c(void);
extern int func_ov004_021ce9b8(void);
extern void func_02001d0c(state_t *, int, int);
extern int func_0208de4c(void);
extern void func_02094504(int, int, int);
extern char *func_0202c0c0(int);
extern int func_020054a4(char *, int);
extern void func_02004f58(int, int, int, int, int, int);
void func_ov004_021cf3a8(void) {
    char *b = data_ov004_0220b500;
    int icon = func_ov004_021ceb6c();
    int i, y;
    for (i=0,y=62;i<4;i++,y+=26) {
        int selected;
        if (*(int *)(b+0x234) != 0 && *(int *)(b+0x22c) == i) selected=1;
        else selected=0;
        func_ov004_021ca0a4((Record *)(b+0x5f90),2,46,y,(void *)2,selected+18);
    }
    if (*(int *)(b+0x54) != 4) {
        if (*(int *)(b+0x60) == 0) {
            int n=*(int *)(b+0x22c);
            int flags=*(int *)(b+0x224);
            if(n>=3)n=3;
            if(flags!=0) {
                if(flags & ~0x1b) func_ov004_021ca0a4((Record *)(b+0x5f90),2,14,n*26+62,(void *)2,22);
            } else func_ov004_021ca0a4((Record *)(b+0x5f90),2,14,n*26+64,(void *)2,24);
        }
        {
            int n=*(int *)(b+0x230);
            int flags=*(int *)(b+0x228);
            if(n>=3)n=3;
            if(flags!=0) {
                if(flags & ~0x1b) func_ov004_021ca0a4((Record *)(b+0x5f90),2,210,n*26+62,(void *)2,23);
            } else func_ov004_021ca0a4((Record *)(b+0x5f90),2,215,n*26+64,(void *)2,25);
        }
    }
    func_ov004_021ca0a4((Record *)(b+0x5f90),2,228,3,(void *)2,icon);
    if (*(int *)(b+0x238) != func_ov004_021ce9b8()) {
        char *text;
        int base;
        int x;
        *(int *)(b+0x238) = func_ov004_021ce9b8();
        func_02001d0c(&data_02102c90,20,12);
        base=func_0208de4c()+0xe20;
        func_02094504(0,base+0x2680,0x780);
        text=func_0202c0c0(*(int *)(b+0x238)+229);
        x=(160-func_020054a4(text,12))/2;
        if(x<=0)x=0;
        func_02004f58((int)&data_02102c90,(int)text,base+0x1000,x+1,81,12);
    }
}

