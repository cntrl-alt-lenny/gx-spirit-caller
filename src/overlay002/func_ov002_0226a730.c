typedef unsigned short u16;
typedef struct { char pad[0xa0]; u16 id, count; char pad2[0xc]; u16 result; } Output;
typedef struct { char pad[0xd44]; int result; char pad2[0x4c]; void *player; int pad3; int state; } State;
typedef struct { char pad[0x1db0]; u16 rolls[1]; } Rolls;
extern Output data_ov002_022d0e6c;
extern State data_ov002_022d016c;
extern Rolls data_ov002_022cf16c;
extern int data_ov002_022cd744[];
extern int func_0202e42c(int x);
extern int func_ov002_021ae484(int x);
extern unsigned int func_ov002_021b00d0(unsigned int x);
extern int func_ov002_021b4054(int a,int b,int c,int d);
extern int func_ov002_021b9144(int a,int b);
extern int func_ov002_021b9ecc(int a,int b);
extern void func_ov002_021d479c(u16 a,u16 b,u16 c,u16 d);
extern void func_ov002_021df6d4(int a,int b);
extern void func_ov002_021e276c(void *self,int a,int b,int c);
int func_ov002_0226a730(void) {
    int player = (int)data_ov002_022d016c.player;
    int count = data_ov002_022d0e6c.count + 1;
    int id = data_ov002_022d0e6c.id;
    int i;
    int result;
    switch(data_ov002_022d016c.state) {
    case 0:
        for(i=0;i<count;i++) {
            data_ov002_022cf16c.rolls[i] = func_ov002_021b00d0(6) + 1;
            func_ov002_021d479c((player ? 0x8000 : 0) | 0x5d,id,data_ov002_022cf16c.rolls[i],0);
        }
        data_ov002_022d016c.state++;
        return 0;
    case 1:
        if(func_ov002_021b4054(player,11,0x16a5,1) && !func_ov002_021b4054(player,11,0x16a5,2)) {
            if(data_ov002_022cd744[player] == 1) {
                result = data_ov002_022d0e6c.result <= 3 ? 1 : 0;
                if(id <= 10) {
                    id = func_ov002_021b9ecc(player,id);
                    if(func_0202e42c(id)) {
                        result = func_ov002_021b9144(id,data_ov002_022d0e6c.result) == 0 ? 1 : 0;
                    }
                }
                data_ov002_022d016c.result = result;
            } else {
                func_ov002_021ae484(0x120);
            }
            data_ov002_022d016c.state++;
            return 0;
        }
        return 1;
    case 2:
        if(!data_ov002_022d016c.result) return 1;
        func_ov002_021df6d4(player,0x16a5);
        func_ov002_021e276c((void *)player,0x16a5,2,0);
        data_ov002_022d016c.state=0;
        return 0;
    }
    return 0;
}

