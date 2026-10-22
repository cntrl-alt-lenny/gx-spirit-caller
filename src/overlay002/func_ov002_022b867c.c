typedef struct { int x,y,z; } Vec;
typedef struct { unsigned short side:1, slot:5, index:8, rest:2; } Card;
extern struct { char pad[0xc2]; short x,y,z; } data_ov002_022ccbdc;
extern short data_ov002_022ccc5c[][3];
extern char data_ov002_022d17f0[];
extern char data_ov002_022d1910[];
extern struct { char pad[0x280]; char rows[2][4][0x2c]; } data_ov002_022d1410;
extern int data_ov002_022cd73c[];
/* Copy32's assembly definition has no C parameters; callers pass src, dst, size. */
extern void Copy32();
static inline char *row(char *base,int side,int slot) { char *q=base; if(slot>=12) q=q+0x280+side*0xb0+(slot-12)*0x2c; else q=0; return q; }
int func_ov002_022b867c(char *p,int side,int slot,int index,void *out) {
    Vec v;
    Card c;
    if (slot < 0 || slot >= 16) {
        v.x=data_ov002_022ccbdc.x;
        v.y=data_ov002_022ccbdc.y;
        v.z=data_ov002_022ccbdc.z;
        Copy32(&v,out,12);
        return 1;
    }
    v.x=data_ov002_022ccc5c[slot][0];
    v.y=data_ov002_022ccc5c[slot][1];
    v.z=data_ov002_022ccc5c[slot][2];
    if (slot == 11) {
        char *q=data_ov002_022d17f0+side*0xcc;
        int count=*(int *)(q+0xa4);
        *(unsigned short *)&c=*(unsigned short *)(data_ov002_022d1910+0x90);
        if (count>=8) count=8;
        index-=*(int *)(q+0xa8);
        if(count>0) v.x+=(2*index-(count-1))*30;
        if(c.slot==11 && c.side==side) {
            c.index-=*(int *)(q+0xa8);
            if(*(int *)(p+0xd00+(c.index%3)*4)!=0) {
                if(index<c.index) v.x-=8;
                else if(index>c.index) v.x+=8;
            }
        }
    } else if ((unsigned)(slot-12)<=3) {
        char *q;
        int n;
        q=row((char *)&data_ov002_022d1410,side,slot);
        n=*(short *)(q+0x2a);
        if(n>40) n=40;
        v.y+=n*20/40;
    }
    if(side==(data_ov002_022cd73c[1]^1)) {v.x=-v.x;v.z=-v.z;}
    Copy32(&v,out,12);
    return 1;
}




