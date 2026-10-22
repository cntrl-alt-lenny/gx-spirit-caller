typedef unsigned short u16;
typedef struct { u16 f0,f2,f4,f6; char pad[0x804]; int active,state; } State;
extern State data_ov002_022ce950;
extern char data_ov002_022d016c[];
extern char data_ov002_022cf16c[];
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern void func_ov002_021b2e04(u16, u16);
extern int func_ov002_0229cd70(int a,int b,int c);
extern int func_ov002_0229ade0(int,int,int,int);
extern int func_ov002_0229c7f8(int);
static inline u16 pack(int side,int slot) { return (unsigned char)side | ((unsigned char)slot << 8); }
void func_ov002_021d3160(void) {
    int side = (data_ov002_022ce950.f0 & 0x8000) ? 1 : 0;
    int value = data_ov002_022ce950.f2 | (data_ov002_022ce950.f4 << 16);
    int count, i;
    int mask = data_ov002_022ce950.f6;
    int original[5];
    int shuffled[5];
    char saved[100];
    switch(data_ov002_022ce950.state) {
    case 0:
        count=0;
        for(i=0;i<5;i++) {
            if((mask >> i)&1) { shuffled[count]=i; original[count]=i; count++; }
        }
        if(count<=1) { data_ov002_022ce950.active=0; return; }
        *(int *)(data_ov002_022d016c+0xce4)=value;
        for(i=count-1;i>0;i--) {
            int j=func_ov002_021b00d0(i+1);
            int t=shuffled[i]; shuffled[i]=shuffled[j]; shuffled[j]=t;
        }
        for(i=0;i<count;i++) func_ov002_021b2e04(pack(side,original[i]),pack(side+2,original[i]));
        for(i=0;i<count;i++) func_ov002_0229cd70((int)(saved+original[i]*20),(int)(data_ov002_022cf16c+(side&1)*0x868+0x30+original[i]*20),20);
        for(i=0;i<count;i++) func_ov002_0229cd70((int)(data_ov002_022cf16c+(side&1)*0x868+0x30+shuffled[i]*20),(int)(saved+original[i]*20),20);
        for(i=0;i<count;i++) func_ov002_021b2e04(pack(side+2,original[i]),pack(side,shuffled[i]));
        for(i=0;i<count;i++) *(unsigned int *)(data_ov002_022cf16c+(side&1)*0x868+shuffled[i]*20+0x40)&=~0x100;
        func_ov002_0229ade0(0x27,side,mask,0);
        data_ov002_022ce950.state++;
        break;
    case 1:
        if(func_ov002_0229c7f8(0x27)==0) data_ov002_022ce950.active=0;
        break;
    }
}

