extern int func_0207f05c(void *, const void *, int);
extern int func_ov002_021ca6f8(int);
extern char data_ov002_022d0f7c[];
extern int data_ov002_022cd73c[];
extern int data_ov002_022cd744[];
extern int data_021040ac[];
typedef struct { unsigned attr; unsigned short tile; unsigned short pad; } Sprite;
void func_ov002_022b4950(int *p) {
    Sprite s;
    int spread, kind, y, x;
    if(p[3]<0) return;
    y=10;
    if(p[8]>128) { spread=(256-p[8])*50/128; kind=p[5]; }
    else { spread=p[8]*50/128; kind=p[4]; }
    if(p[2]<4) y-=(4-p[2])*8;
    s.attr=0x40002000;
    s.tile=0;
    if(kind!=7) {
        for(int i=0;i<2;i++) {
            x=spread*(1-i*2)+(70+i*100);
            s.attr=(s.attr&0xfe00ff00)|(y&255)|((x&511)<<16);
            s.tile=(s.tile&~1023)|((0x2e80+((p[6]/16)&3)*256)/32);
            func_0207f05c(data_ov002_022d0f7c,&s,1);
        }
        for(int i=0;i<5;i++) {
            x=88+i*16;
            if(70+spread<x && x<170-spread) {
                s.attr=(s.attr&0xfe00ff00)|(y&255)|((x&511)<<16);
                s.tile=(s.tile&~1023)|((0x2980+i*256)/32);
                func_0207f05c(data_ov002_022d0f7c,&s,1);
            }
        }
    }
    y=10-(4-p[2])*8;
    for(int i=0;i<2;i++) {
        x=i==(data_ov002_022cd73c[1]^1)?189:52;
        s.attr=(s.attr&0xfe00ff00)|(y&255)|((x&511)<<16);
        x=(func_ov002_021ca6f8(i)==0)*256;
        unsigned short old=s.tile;
        x=(0x3d80+x)/32;
        s.tile=(old&~1023)|x;
        func_0207f05c(data_ov002_022d0f7c,&s,1);
    }
    kind=1;
    if(data_021040ac[0xb88/4]!=1 && data_021040ac[0xb88/4]!=2) kind=0;
    if(kind) {
        s.attr&=0x3fff3fff;
        y+=16;
        for(int i=0;i<2;i++) {
            x=i==(data_ov002_022cd73c[1]^1)?189:52;
            int j=data_021040ac[0xb94/4+i];
            s.attr=(s.attr&0xfe00ff00)|(y&255)|((x&511)<<16);
            s.tile=(s.tile&~1023)|((0x3280+(i*2+(j>i))*64)/32);
            func_0207f05c(data_ov002_022d0f7c,&s,1);
            s.attr=(s.attr&0xfe00ff00)|(y&255)|(((x+8)&511)<<16);
            s.tile=(s.tile&~1023)|((0x3280+(i*2+(j>(i==0)))*64)/32);
            func_0207f05c(data_ov002_022d0f7c,&s,1);
        }
    }
    if(p[25]==0 && data_ov002_022cd744[data_ov002_022cd73c[1]]==0 && func_ov002_021ca6f8(data_ov002_022cd73c[1])!=0) {
        x=(p[6]/8&3)+157;
        s.attr=(s.attr&0x3fff3fff)|0x80000000;
        s.tile=(s.tile&~1023)|508;
        s.attr=((s.attr&0xfe00ff00)|(unsigned char)x)|0x700000;
        func_0207f05c(data_ov002_022d0f7c,&s,1);
        s.attr=(s.attr&0xfe00ff00)|(unsigned char)x|0xd40000;
        func_0207f05c(data_ov002_022d0f7c,&s,1);
        s.attr=(s.attr&0xfe00ff00)|(unsigned char)x|0xc0000;
        func_0207f05c(data_ov002_022d0f7c,&s,1);
    }
    if(p[7]!=0) return;
}









