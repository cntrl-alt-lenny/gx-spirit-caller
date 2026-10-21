struct F021f4a4c_Self {
    unsigned short pad0;
    struct { unsigned short bit0:1; unsigned short rest:15; } f2;
    int pad4;
    unsigned short masks[2];
    unsigned short count;
};
struct State { char pad[0x5b4]; int step; };
struct Request { char pad[0xd44]; int active; char pad2[0x28]; int side, first, second; };
struct Bits { unsigned int pad:13; unsigned int flag:1; unsigned int pad2:8; unsigned int code:8; unsigned int pad3:2; };
struct Card { struct Bits bits; char tail[16]; };
struct Player { char pad[0x30]; struct Card cards[11]; char tail[0x75c]; };
extern struct State data_ov002_022ce288;
extern struct Request data_ov002_022d016c;
extern struct Player data_ov002_022cf16c[];
extern int data_ov002_022cd744[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021ae484(int x);
extern int func_ov002_021deb84(int arg0, int arg1);
extern int func_ov002_021e7584(void *arg0, int arg1, int arg2);
extern int func_ov002_021f4a4c(struct F021f4a4c_Self *self, int unused1);
extern int func_ov002_022577dc(void *self);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern int func_ov002_0229ade0(int a, int b, int c, int d);
int func_ov002_021f9978(struct F021f4a4c_Self *self, int arg) {
    int side, first, second;
    struct Player *player;
    struct Bits *card;
    switch (data_ov002_022ce288.step) {
    case 0:
        self->masks[1]=0;
        self->masks[0]=0;
        self->count=0;
        data_ov002_022ce288.step++;
        return 0;
    case 1:
        func_ov002_021ae400(self->f2.bit0, 0x12);
        data_ov002_022d016c.active=1;
        data_ov002_022ce288.step++;
        return 0;
    case 2: case 5:
        if (data_ov002_022d016c.active == 0) {
            data_ov002_022ce288.step=7;
            return 0;
        }
        func_ov002_0225935c(self->f2.bit0,1,(int)func_ov002_021e7584);
        data_ov002_022ce288.step++;
        return 0;
    case 3: case 6:
        if (func_ov002_022593f4()) {
            side=data_ov002_022d016c.side;
            first=data_ov002_022d016c.first;
            second=data_ov002_022d016c.second;
            player=&data_ov002_022cf16c[side & 1];
            self->masks[side] |= 1 << (first+second);
            card=&player->cards[first+second].bits;
            func_ov002_0229ade0(0x28,side,first+second,card->code*2+card->flag);
            self->count++;
            data_ov002_022ce288.step++;
            return 0;
        } else {
            data_ov002_022ce288.step-=2;
            return 0;
        }
    case 4:
        if (self->count >= func_ov002_022577dc(self)) {
            data_ov002_022ce288.step=7;
            return 0;
        }
        if (data_ov002_022cd744[self->f2.bit0] == 1) {
            data_ov002_022d016c.active=0;
        } else {
            func_ov002_021ae484(0x138);
        }
        data_ov002_022ce288.step++;
        return 0;
    case 7:
        func_ov002_021deb84(self->f2.bit0,self->masks[0] | self->masks[1]<<16);
        func_ov002_021f4a4c(self,arg);
        return 1;
    }
    return 0;
}



