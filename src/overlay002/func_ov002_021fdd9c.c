typedef unsigned short u16;
typedef unsigned int u32;
struct State { int first[2], second[2], third[2]; int flag, field7, field8, field9, field10, field11; };
extern unsigned char data_ov002_022cf16c[], data_ov002_022d016c[];
extern int func_ov002_021b3fd8(int arg0,int arg1,int arg2,int arg3);
extern int func_ov002_021b3ecc(int arg0,int arg1,int arg2);
extern int func_ov002_021bb068(int id);
extern int func_ov002_021bb7b0(int arg0);
extern int func_ov002_021b9ecc(int,int);
extern int func_ov002_021bd710(int,int);
/* These definitions say void, but this original caller tests the returned r0. */
extern int func_ov002_021b3014(int arg0,int arg1,int arg2);
extern int func_ov002_021b30ac(int arg0,int arg1,int arg2);
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_021bae7c(int player,int id,int except);
/* Original supplies only r0-r1, rather than the definition's four arguments. */
extern int func_ov002_021bb90c();
void func_ov002_021fdd9c(struct State *s) {
    int player, slot, minimum, offset;
    unsigned char *row;
    int other, selected, id;
    s->flag=0;
    s->first[0]=func_ov002_021b3fd8(0,11,0x1679,2)|func_ov002_021b3ecc(1,11,0x1840);
    s->first[1]=func_ov002_021b3fd8(1,11,0x1679,2)|func_ov002_021b3ecc(0,11,0x1840);
    s->second[0]=func_ov002_021b3fd8(0,11,0x1679,2);
    s->second[1]=func_ov002_021b3fd8(1,11,0x1679,2);
    s->third[0]=func_ov002_021b3fd8(0,11,0x1679,1);
    s->third[1]=func_ov002_021b3fd8(1,11,0x1679,1);
    s->field7=func_ov002_021b3ecc(0,11,0x1351);
    s->field8=func_ov002_021b3ecc(0,11,0x1350);
    s->field9=func_ov002_021b3ecc(0,11,0x134f);
    s->field10=func_ov002_021b3ecc(0,11,0x134e);
    s->field11=func_ov002_021b3ecc(0,11,0x12bf);
    if (func_ov002_021bb068(0x166c)) {
        int v=func_ov002_021bb7b0(0x166c);
        if (!s->third[0]) s->third[0]=v;
        if (!s->third[1]) s->third[1]=v;
    }
    minimum=0;
    for (player=0,offset=0; player<2; player++,offset+=16) {
        row=data_ov002_022cf16c+(player&1)*0x868;
        other=1-player;
        for(slot=0;slot<=4;slot++,row+=20) {
            if (func_ov002_021b9ecc(player,slot)==0x1955 && *(u16 *)(row+0x38) && !(((*(u32 *)(row+0x40)>>1)|(*(u32 *)(row+0x40)>>2))&1) && !(*(u32 *)(data_ov002_022d016c+0xd4)&(1<<(slot+offset))) && !(s->field11 && *(u16 *)(row+0x36)) && !func_ov002_021bd710(player,slot) && !func_ov002_021b3014(player,slot,0x1a6d) && func_ov002_021bbf50(other)==3) {
                if (!minimum || minimum>*(u16 *)(row+0x34)) { minimum=*(u16 *)(row+0x34); selected=other; }
            }
        }
    }
    if (minimum) {
        if (!s->third[selected] || s->third[selected]>minimum) {
            s->third[selected]=1; s->second[selected]=1; s->first[selected]=1;
        }
    }
    {
    int offset2;
    unsigned char *row2;
    int player2;
    for(player2=0,offset2=0;player2<2;player2++,offset2+=16) {
        if (s->third[player2]) continue;
        row2=data_ov002_022cf16c+(player2&1)*0x868;
        other=1-player2;
        for(slot=0;slot<=4;row2+=20,slot++) {
            id=func_ov002_021b9ecc(player2,slot);
            if (id && *(u16 *)(row2+0x38) && !(((*(u32 *)(row2+0x40)>>1)|(*(u32 *)(row2+0x40)>>2))&1) && !(*(u32 *)(data_ov002_022d016c+0xd4)&(1<<(slot+offset2))) && !(s->field11 && *(u16 *)(row2+0x36)) && !func_ov002_021bd710(player2,slot) && !func_ov002_021b3014(player2,slot,0x1a6d) && !func_ov002_021b3ecc(player2,slot,0x1944)) {
                switch(id) {
                case 0x1296:
                    if(func_ov002_021b30ac(player2,slot,0x12d3)) s->first[other]=1;
                    else { s->first[1]=1; s->first[0]=1; }
                    break;
                case 0x14da: s->flag=1; break;
                case 0x15da:
                case 0x1816: s->second[1]=1; s->second[0]=1; break;
                case 0x19c6: s->field8=1; s->field7=1; break;
                }
            }
        }
    }
    }
    if (!s->field8) {
        for(player=0;player<2;player++) {
            if (!s->second[player] && func_ov002_021bae7c(player,0x1760,-1)) { s->first[1]=1; s->first[0]=1; }
        }
    }
    if(s->field7) return;
    for(player=0;player<2;player++) {
        if(!s->first[player] && func_ov002_021bb90c(player,0x1302)) {
            if(!s->first[0]) s->first[0]=2;
            if(!s->first[1]) s->first[1]=2;
        }
    }
    for(player=0;player<2;player++) {
        if(!s->first[player]) {
            if(func_ov002_021bb90c(player,0x1360)) {s->second[1]=1;s->second[0]=1;}
            if(func_ov002_021bb90c(player,0x1765)) {s->second[1]=1;s->second[0]=1;}
            if(func_ov002_021bb90c(player,0x1495)) s->field10=1;
            if(func_ov002_021bb90c(player,0x148e)) s->flag=1;
        }
    }
}



