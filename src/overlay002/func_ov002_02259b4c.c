typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { int id; int kind; int (*test)(int, int); int (*action)(int, unsigned int); } Entry;
typedef struct { u16 id; u16 type:4; u16 mode:4; u16 rest:8; u16 value; u16 next; } Node;
typedef struct { u32 id:13; u32 player:1; u32 rest:18; } Card;
typedef struct { int pad[3]; unsigned count; Card cards[256]; u16 kinds[256]; } Output;
extern Entry data_ov002_022c819c[];
extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];
extern char data_ov002_022cf282[];
typedef struct { u16 value:13; u16 rest:3; u16 pad; } Info;
extern Info data_ov002_022d0250[];
extern Node data_ov002_022d0650[];
extern Output data_ov002_022cdc78;
extern int func_ov002_021b99b4(int player, int id);
extern void *func_ov002_021c93f0(int player, int kind, int extra);
extern int func_ov002_021c9504(int player, int kind, int extra);
extern u32 func_ov002_021c9a08(u32 side, int kind);
extern int func_ov002_021fd81c(u32 packed, u16 value, int extra);
extern int func_ov002_02259a40(int a, unsigned int b);
void func_ov002_02259b4c(int player, int unused, int kind) {
    int list[32];
    int count = 0;
    int blocked = 0;
    unsigned i;
    for (i=0; i<*(u32 *)(data_ov002_022ce288+0x5d4); i++) {
        if ((unsigned char)data_ov002_022ce288[0x5dc+i]>5) blocked=1;
    }
    for (i=0; i<27; i++) {
        if (kind == data_ov002_022c819c[i].kind) {
            int id=data_ov002_022c819c[i].id;
        if (
            (!blocked || id==0x1aac || id==0x1b2c)) {
            if (data_ov002_022c819c[i].test(player,id)) list[count++]=i;
        }
        }
    }
    if (*(int *)(data_ov002_022d016c+0xcec)==player &&
        (*(int *)(data_ov002_022d016c+0xcf8)==2 || *(int *)(data_ov002_022d016c+0xcf8)==4) &&
        !blocked && kind==14) {
        i=*(u16 *)(data_ov002_022cf282+(player&1)*0x868);
        if (i) {
            blocked=(((u32)player<<31)&0x80000000)|0x464e0000;
            do {
                Node *p=&data_ov002_022d0650[i];
                i=p->next;
                if (p->type==1 && p->id==0x1a04 && p->mode==0) {
                    int value=p->value;
                    if (func_ov002_021b99b4(player,value)>=0) {
                        if (func_ov002_021fd81c(blocked | (u16)(int)data_ov002_022d0250[value].value, (u16)value,0))
                            list[count++]=-value;
                    }
                }
            } while(i);
        }
    }
    {
        int k;
        for(k=0;k<count;k++) {
            int index=list[k];
            if(index<0) {
                int slot=func_ov002_021b99b4(player,-index);
                data_ov002_022cdc78.cards[data_ov002_022cdc78.count]=*(Card *)func_ov002_021c93f0(player,kind,slot);
                data_ov002_022cdc78.kinds[data_ov002_022cdc78.count]=kind;
                data_ov002_022cdc78.count += data_ov002_022cdc78.count<255;
            } else {
                int id=data_ov002_022c819c[index].id;
                if(data_ov002_022c819c[index].action != func_ov002_02259a40) {
                    int j;
                    for(j=func_ov002_021c9a08(player,kind)-1;j>=0;j--) {
                        if(id==func_ov002_021c9504(player,kind,j)) {
                            data_ov002_022cdc78.cards[data_ov002_022cdc78.count]=*(Card *)func_ov002_021c93f0(player,kind,j);
                            data_ov002_022cdc78.kinds[data_ov002_022cdc78.count]=kind;
                            data_ov002_022cdc78.count+=data_ov002_022cdc78.count<255;
                        }
                    }
                } else {
                    Card card={0};
                    card.id=id;
                    card.player=player;
                    data_ov002_022cdc78.cards[data_ov002_022cdc78.count]=card;
                    data_ov002_022cdc78.kinds[data_ov002_022cdc78.count]=16;
                    data_ov002_022cdc78.count+=data_ov002_022cdc78.count<255;
                }
            }
        }
    }
}




