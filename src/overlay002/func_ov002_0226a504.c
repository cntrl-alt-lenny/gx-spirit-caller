typedef unsigned short u16;
typedef struct { char pad[0xa0]; u16 a0,a2; char pad2[0xc]; u16 b0,b2; } Output;
typedef struct { char pad[0xd44]; int result; char pad2[0x4c]; int player; int pad3; int state; } State;
extern Output data_ov002_022d0e6c;
extern State data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern int data_ov002_022cd73c[];
extern int func_ov002_021ae484(int x);
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern int func_ov002_021b0b0c(int arg0);
extern void func_ov002_021b0b54(int id,int value);
extern int func_ov002_021b0bdc(void *self,int arg);
extern int func_ov002_021b0c04(void *self,int arg1);
extern int func_ov002_021b3ecc(int arg0,int arg1,int arg2);
extern int func_ov002_021bae7c(int player,int id,int except);
extern void func_ov002_021d479c(u16 a0,u16 a1,u16 a2,u16 a3);
extern void func_ov002_021df680(int arg0,int arg1);
extern void func_ov002_021e276c(void *self,int a,int b,int c);
int func_ov002_0226a504(void) {
    int packed = data_ov002_022d0e6c.a2;
    int player = data_ov002_022d016c.player;
    int count = packed & 255;
    int kind = (packed >> 8) & 255;
    int id = data_ov002_022d0e6c.a0;
    int i;
    switch(data_ov002_022d016c.state) {
    case 0:
        data_ov002_022d0e6c.b0 = 0;
        data_ov002_022d0e6c.b2 = 0;
        for(i=0;i<count;i++) {
            int value = func_ov002_021b00d0(2);
            data_ov002_022d0e6c.b0 = value + (data_ov002_022d0e6c.b0 << 1);
            data_ov002_022d0e6c.b2 += value == kind ? 1 : 0;
        }
        func_ov002_021d479c((player ? 0x8000 : 0) | 0x5c,id,((unsigned char)count | ((unsigned char)kind << 8)),data_ov002_022d0e6c.b0);
        data_ov002_022d016c.state++;
        return 0;
    case 1:
        if(func_ov002_021bae7c(player,0x150f,-1) && !func_ov002_021b3ecc(player,11,0x150f)) {
            if(data_ov002_022cd744[player] == 1) {
                data_ov002_022d016c.result = data_ov002_022d0e6c.b2 <= count/2 ? 1 : 0;
            } else {
                func_ov002_021ae484(0x11f);
            }
            data_ov002_022d016c.state++;
            return 0;
        }
        break;
    case 2:
        if(data_ov002_022d016c.result) {
            func_ov002_021df680(player,0x150f);
            func_ov002_021e276c(player,0x150f,1,0);
            data_ov002_022d016c.state=0;
            return 0;
        }
        break;
    }
    if(player == data_ov002_022cd73c[1]) {
        if(data_ov002_022d0e6c.b2 > count/2) {
            func_ov002_021b0c04(0x33,1);
            func_ov002_021b0bdc(0x34,func_ov002_021b0b0c(0x33));
        } else {
            func_ov002_021b0b54(0x33,0);
        }
    }
    return 1;
}



