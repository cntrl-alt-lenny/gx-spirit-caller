typedef struct { int head[9]; int value[2]; int pad[4]; int timer[2]; int delta[2]; } State;
struct FuncOv002022b36f0Self { char pad[52]; int tbl_a[64]; };
extern void func_ov002_022b36f0(struct FuncOv002022b36f0Self *self, int idx, int arg2);
extern void func_ov002_022b32c8(char *self, int side, int kind);
extern void func_ov002_022b3434(int unused0, int unused1);
extern void func_ov002_022b3448(char *self, int kind);
extern unsigned int func_02006194(void);
extern int func_ov002_021ca6f8(int idx);
extern int data_ov002_022cd73c[];
extern unsigned short data_02104bac[];
#define F(o) (*(int *)(self + (o)))
#define A(o,i) (*(int *)(self + (i)*4 + (o)))
void func_ov002_022b394c(char *self) {
    int i;
    if (F(0) == 0) return;
    if (F(4) != 0 && F(8) < 4) F(8)++;
    else if (F(4) == 0 && F(8) > 0) F(8)--;
    F(0x18)++;
    if (F(4) != 0) {
        for (i=0; i<2; i++) {
            if (((State *)self)->timer[i]>0) {
                if (--((State *)self)->timer[i]==0) func_ov002_022b32c8(self,i,0);
            }
        }
    }
    if (func_ov002_021ca6f8(data_ov002_022cd73c[1]) == 0) F(0x64)=0;
    else if (func_02006194()!=0 || data_02104bac[0x29]!=0) F(0x64)=1;
    if (F(0x5c)!=0) { F(0x5c)--; return; }
    if (F(0x54)>128) {
        F(0x54)-=8;
        if (F(0x54)==128) F(0x5c)=32;
    } else if (F(0x54)==128 && (F(0x44)!=0 || F(0x48)!=0)) {
        for (i=0;i<2;i++) {
            int delta=((State *)self)->delta[i];
            if (delta!=0) {
                int amount=delta>=0 ? delta : -delta;
                if (amount>=100) amount=100;
                if (delta>0) {
                    if (F(0x58)!=0 || ((State *)self)->value[i]!=0) ((State *)self)->value[i]+=amount;
                    ((State *)self)->delta[i]-=amount;
                } else {
                    int value=((State *)self)->value[i]-amount;
                    if (value<=0) {
                        ((State *)self)->value[i]=0;
                        ((State *)self)->delta[i]=0;
                    } else {
                        ((State *)self)->value[i]= value<0 ? 0 : value;
                        ((State *)self)->delta[i]+=amount;
                    }
                }
            }
        }
    } else if (F(0x54)!=0) {
        if (F(0x58)==5) F(0x54)=0;
        else F(0x54)-=16;
        if (F(0x54)==0) { F(0x50)=0; F(0x4c)=0; }
    }
    if (F(0x54)!=0) {
        switch(F(0x58)) {
        case 0:
            for(i=0;i<2;i++) if(((State *)self)->delta[i]!=0) func_ov002_022b36f0((struct FuncOv002022b36f0Self *)self,i,1);
            break;
        case 1: case 2:
            for(i=0;i<2;i++) if(((State *)self)->delta[i]!=0) func_ov002_022b36f0((struct FuncOv002022b36f0Self *)self,i,2);
            break;
        }
    }
    if (F(0x1c)!=0) {
        if (F(0x1c)==128) func_ov002_022b3434((int)self,F(0xc));
        F(0x1c)-=4;
    }
    if (F(0x20)!=0) {
        if (F(0x20)==128) func_ov002_022b3448(self,F(0x10));
        F(0x20)-=8;
    }
}


