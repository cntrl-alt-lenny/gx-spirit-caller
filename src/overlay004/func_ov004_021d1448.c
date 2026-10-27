extern char data_ov004_0220b500[], data_02104bac[];
extern void func_02006110(int *, int *);
extern unsigned int func_02006164(void), func_0200617c(void), func_02006194(void);
extern int func_0201cd1c(int, unsigned short *, int);
extern int func_0201cfe0(void), func_02021c0c(void);
extern void func_ov004_021d02f4(void), func_ov004_021d0530(int), func_ov004_021d05f4(int);
extern void func_ov004_021d1264(void), func_ov004_021d12b0(void), func_ov004_021d1308(void), func_ov004_021d1360(void), func_ov004_021d13dc(void);
#define F(o) (*(int *)(b + (o)))
void func_ov004_021d1448(void) {
    char *b = data_ov004_0220b500;
    int x,y, xx,yy;
    unsigned short msg;
    int old, i, top, index, count, delta;
    unsigned short keys;
    F(0x9c)=0;
    if (F(0x5c)!=0) return;
    if (F(0x54)!=15) {
        old=F(0x3c84);
        if (func_02006194()!=0 || func_0200617c()!=0) {
            func_02006110(&x,&y);
            if (x>=224 && x<250 && y>=164 && y<190) {
                F(0xa0)=1;
                if (func_0200617c()!=0) func_ov004_021d1264();
            }
            for (i=0;i<2;i++) {
                top=i!=0 ? 37:106;
                if (y>=top && y<top+26 && x>=15 && x<239) {
                    delta=x-15;
                    if (delta%23<20) {
                        index=delta/23;
                        if (func_02006164()!=0 && i!=0) {
                            if (F(0x3c84)==(i==0?1:0) && F(0x3c80)==index && index<((int *)(b+0x3c0c))[i]) {
                                F(0x3c88)=1;
                                func_ov004_021d1308();
                            }
                        }
                        F(0x3c84)=i==0?1:0;
                        F(0x3c80)=index;
                    } else F(0x60)=1;
                }
            }
            if (y>=137 && y<157 && x>=41 && x<215) {
                F(0x3c84)=2;
                F(0x9c)=1;
                if (func_0200617c()!=0) func_ov004_021d12b0();
            }
        } else {
            keys=*(unsigned short *)(data_02104bac+0x54);
            if (keys&2) { F(0xa0)=1; func_ov004_021d1264(); }
            else if (keys&0x400) { F(0x9c)=1; func_ov004_021d12b0(); }
            else if (keys&0x40) { if (F(0x3c84)>0) F(0x3c84)--; }
            else if (keys&0x80) { if (F(0x3c84)<2) F(0x3c84)++; }
            else switch(F(0x3c84)) {
            case 0:
                if (keys&1) {
                    if (F(0x3c80)<F(0x3c10)) { F(0x3c88)=1; func_ov004_021d1308(); }
                } else if (keys&0x10) { if (F(0x3c80)<9) F(0x3c80)++; }
                else if (keys&0x20) { if (F(0x3c80)>0) F(0x3c80)--; }
                break;
            case 1:
                if (keys&0x10) { if (F(0x3c80)<9) F(0x3c80)++; }
                else if (keys&0x20) { if (F(0x3c80)>0) F(0x3c80)--; }
                break;
            case 2:
                if (keys&1) { F(0x9c)=1; func_ov004_021d12b0(); }
                break;
            }
        }
        if ((old>0)!=(F(0x3c84)>0)) {
            int id=F(0x3c84)!=0?9:12;
            func_ov004_021d0530(id+0x3b6);
        }
        func_ov004_021d05f4(1);
    } else if (F(0x3c74)==0) {
        if (func_02006194()!=0 || func_0200617c()!=0) {
            func_02006110(&xx,&yy);
            for(i=0;i<2;i++) {
                top=i!=0?37:106;
                if (yy>=top && yy<top+26 && xx>=118 && xx<138) F(0x3c84)=i==0?1:0;
            }
            if (yy>=137 && yy<158) {
                if (xx>=47 && xx<123) {
                    F(0x9c)=1; F(0x3c84)=2;
                    if (func_0200617c()!=0) func_ov004_021d1360();
                }
                if (xx>=132 && xx<208) {
                    F(0xa0)=1; F(0x3c84)=3;
                    if (func_0200617c()!=0) func_ov004_021d13dc();
                }
            }
        } else {
            keys=*(unsigned short *)(data_02104bac+0x54);
            if (keys&1) {
                switch(F(0x3c84)) {
                case 2: F(0x9c)=1; func_ov004_021d1360(); break;
                case 3: F(0xa0)=1; func_ov004_021d13dc(); break;
                }
            } else if (keys&2) { F(0xa0)=1; F(0x3c84)=3; func_ov004_021d13dc(); }
            else if (keys&0x40) F(0x3c84)=F(0x3c84)>1?1:0;
            else if (keys&0x80) F(0x3c84)+=F(0x3c84)<3?1:0;
            else if (keys&0x10) { if (F(0x3c84)==2) F(0x3c84)=3; }
            else if (keys&0x20) { if (F(0x3c84)==3) F(0x3c84)=2; }
        }
    } else {
        count=F(0x3c78);
        if (F(0x3c74)<=count) count=F(0x3c74);
        if (func_0201cfe0()!=0 && count==192) {
            msg=16;
            func_0201cd1c(6,&msg,2);
        }
    }
    func_ov004_021d02f4();
    func_02021c0c();
}


