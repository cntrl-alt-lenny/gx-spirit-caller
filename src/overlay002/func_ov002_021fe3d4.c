typedef unsigned int u32;
typedef unsigned short u16;
struct Card { u32 id:13; u32 pad:8; u32 flag:1; u32 rest:10; };
struct State { int first[2], second[2], third[2]; int flag, field7, field8, field9, field10, field11; };
extern unsigned char data_ov002_022cf16c[];
extern void func_ov002_021fdd9c(struct State *state);
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8c0(int id);
extern int func_0202e270(int unused0);
extern int func_0202f9e8(int id);
extern int IsValue12D3Or147E(int a0);
extern int func_ov002_021b3ecc(int arg0,int arg1,int arg2);
extern int func_ov002_021b9ecc(int self,int playerRow);
extern int func_ov002_021bd710(int,int);
/* The original caller tests r0 despite the void definitions. */
extern int func_ov002_021b3014(int arg0,int arg1,int arg2);
extern int func_ov002_021b30ac(int arg0,int arg1,int arg2);
extern int func_ov002_021b8fcc(int a0,int a1);
extern int func_ov002_021c2624(int,int,int);
extern int func_ov002_021bb444(int self,int id);
extern int func_ov002_021b3434(int,int,int,int);
/* Original supplies only r0-r1; the four-argument prototype fails here. */
extern int func_ov002_021c8940();
extern void func_ov002_021d899c(int,int,int);
int func_ov002_021fe3d4(void) {
    struct State state;
    int player, slot, index, other;
    int changed = 0, has;
    struct Card *card;
    unsigned char *row, *otherrow;
    struct Card *othercard;
    int disabled, id;
    func_ov002_021fdd9c(&state);
    for (player=0; player<2; player++) {
        row = data_ov002_022cf16c + (player & 1)*0x868;
        card = (struct Card *)(row+0x30);
        for (slot=0; slot<=10; slot++, card=(struct Card *)((char *)card+20), row+=20) {
            disabled=0;
            id=card->id;
            if (id && *(u16 *)(row+0x38) && !(((*(u32 *)(row+0x40)>>1)|(*(u32 *)(row+0x40)>>2))&1) && !IsValue12D3Or147E(id)) {
                if (slot<=4 && func_0202e270(id) && !func_ov002_021b3ecc(player,slot,0x1a5c)) {
                    int value=func_ov002_021b9ecc(player,slot);
                    if (value==0x1437 || value==0x194e || value==0x19c3) {
                        if (state.third[player]) disabled = state.third[player] < *(u16 *)(row+0x34);
                    } else {
                        if (state.third[player]) disabled=1;
                        if (state.field11 && *(u16 *)(row+0x36)) disabled=1;
                    }
                    if (func_ov002_021bd710(player,slot)) disabled=1;
                    if (card->flag) disabled=1;
                    if (func_0202f9e8(id)==1) {
                        if (state.flag) disabled=1;
                        if (func_ov002_021b3ecc(player,slot,0x1433)) disabled=1;
                    }
                    if (func_ov002_021b3ecc(player,slot,0x1944)) disabled=1;
                    if (func_ov002_021b3014(player,slot,0x1a6d)) disabled=1;
                    if (func_0202b878(id)==9) {
                        if (func_ov002_021b30ac(player,slot,0x1a9b)) disabled=1;
                    }
                }
                if (slot>=5 || func_ov002_021b8fcc(player,slot)) {
                    if (func_0202b878(id)==0x17 && !((*(u32 *)(row+0x40)>>9)&1)) {
                        if (state.first[player]==2 && id!=0x1302) disabled=1;
                        else if (state.first[player]==1) disabled=1;
                        if (state.field7 && func_0202b8c0(id)==4) disabled=1;
                    } else {
                        if (state.second[player]) disabled=1;
                        if (state.field8 && func_0202b8c0(id)==4) disabled=1;
                    }
                    if (state.field10 && func_ov002_021c2624(player,slot,id)) disabled=1;
                    if (state.field9 && slot==10) disabled=1;
                    if (func_ov002_021b3ecc(player,slot,0x17c2)) disabled=1;
                    if (!disabled) {
                        for (other=0; other<2; other++) {
                            has=func_ov002_021bb444(other,0x1a07);
                            otherrow=data_ov002_022cf16c+(other&1)*0x868;
                            index=0;
                            othercard=(struct Card *)(otherrow+0x30);
                            for (; index<=4; otherrow+=20, othercard=(struct Card *)((char *)othercard+20), index++) {
                                int value=func_ov002_021b9ecc(other,index);
                                switch(value) {
                                case 0x1812:
                                    if (other!=player && func_0202b878(id)!=0x17) {
                                        u32 flags=*(u32 *)(otherrow+0x40);
                                        if (*(u16 *)(otherrow+0x38) & ~((flags>>6)&1) & ~(((flags>>1)|(flags>>2))&1)) {
                                            if (func_ov002_021b3434(player,slot,other,index)) disabled=1;
                                        }
                                    }
                                    break;
                                case 0x172e:
                                    if (other!=player) {
                                        u32 flags=*(u32 *)(otherrow+0x40);
                                        if (*(u16 *)(otherrow+0x38) & ~((flags>>6)&1) & ~(((flags>>1)|(flags>>2))&1)) {
                                            if (func_ov002_021b3434(player,slot,other,index)) disabled=1;
                                        }
                                    }
                                    break;
                                case 0x1a1d:
                                    if (*(u32 *)(otherrow+0x3c)==0x1a2f) {
                                        u32 flags=*(u32 *)(otherrow+0x40);
                                        if (*(u16 *)(otherrow+0x38) & ~((flags>>6)&1) & ~(((flags>>1)|(flags>>2))&1)) {
                                            if (func_ov002_021b3434(player,slot,other,index)) disabled=1;
                                        }
                                    }
                                    break;
                                }
                                if (has && othercard->id && func_ov002_021c8940(other,index)==7) {
                                    if (func_ov002_021b3434(player,slot,other,index)) disabled=1;
                                }
                            }
                        }
                    }
                }
                if ((*(u32 *)(row+0x40)>>7)&1) disabled=1;
            }
            if (disabled != ((*(u32 *)(row+0x40)>>6)&1)) {
                func_ov002_021d899c(player,slot,disabled);
                changed=1;
            }
        }
    }
    return changed;
}





