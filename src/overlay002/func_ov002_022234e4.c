typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Card {
    u16 id;
    u16 side:1; u16 unused2:13; u16 flipped:1; u16 unused3:1;
    u16 unused4:5; u16 active:1; u16 unused5:10;
    u16 pad[9]; u16 effect; u16 owner:1; u16 unused6:15;
} Card;
struct Self { u16 id; u16 side:1; u16 rest:15; u16 pad[2]; u16 choice; };
struct State { char pad[0x5a8]; int state; int slot; };
struct Request { char pad[0xd44]; int choice; };
struct Selection { char pad[0xb0]; u16 slot; };
struct Entry { u32 id:13; u32 lo:1; u32 pad:8; u32 hi:8; u32 rest:2; };
struct Row { char pad[0x120]; struct Entry entries[466]; };
extern struct State data_ov002_022ce288;
extern struct Request data_ov002_022d016c;
extern struct Selection data_ov002_022d0e6c;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf16c[];
extern unsigned int func_0202b878(int id);
extern int func_0202e234(int x);
extern void func_ov002_021ae514(int,int,int,int,int,int);
extern int func_ov002_021df818(Card *card,int side,int amount);
extern int func_ov002_021e278c(int arg0,int arg1);
extern int func_ov002_02257594(void *arg0,int arg1);
extern void func_ov002_0226af78(int arg0,int arg1);
extern int func_ov002_0226b0d0(int arg0,int arg1,int arg2);
extern int func_ov002_02281b5c(int player,int slot);
int func_ov002_022234e4(struct Self *self,int arg1) {
    int result;
    int id;
    struct Entry *entry;
    switch(data_ov002_022ce288.state) {
    case 0x80:
        if(func_ov002_02257594(self,arg1)==0) return 0;
        func_ov002_0226af78(1-self->side,0);
        return 0x7f;
    case 0x7f:
        data_ov002_022ce288.slot=data_ov002_022d0e6c.slot;
        if(data_ov002_022cd744[self->side]==1) {
            data_ov002_022d016c.choice=func_ov002_02281b5c(1-self->side,data_ov002_022d0e6c.slot);
        } else {
            func_ov002_021ae514(0x104,0x1b8,0x1b9,0x1ba,0,15);
        }
        return 0x7e;
    case 0x7e:
        self->choice=data_ov002_022d016c.choice;
        func_ov002_0226b0d0(1-self->side,self->id,data_ov002_022d016c.choice);
        return 0x7d;
    case 0x7d:
        entry=&((struct Row *)(data_ov002_022cf16c+((1-self->side)&1)*0x868))->entries[data_ov002_022ce288.slot];
        func_ov002_021e278c(1-self->side,entry->hi*2+entry->lo);
        id=((struct Row *)(data_ov002_022cf16c+((1-self->side)&1)*0x868))->entries[data_ov002_022ce288.slot].id;
        result=0;
        switch(self->choice) {
        case 0: result=func_0202e234(id); break;
        case 1: result=func_0202b878(id)==0x16; break;
        case 2: result=func_0202b878(id)==0x17; break;
        }
        if(result) func_ov002_021df818((Card *)self,1-self->side,0x2bc);
        return 0;
    }
    return 0;
}
