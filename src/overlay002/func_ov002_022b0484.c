typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { char pad[0x14]; u32 count; u32 other; u32 count2; u16 cards[95]; u16 cards2[21]; } Player;
extern int func_0201174c(void);
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b890(int id);
extern unsigned int func_0202b8a8(int id);
extern unsigned short func_0202b9b0(unsigned short key);
extern int func_0202df78(int a, int b);
extern int func_0202e234(int x);
extern int func_0202e270(int unused0);
extern int func_ov002_021b0b0c(int arg0);
/* The existing void-pointer thunk declaration conflicts with its integer-ID
 * destination and the result consumed here. This is the assembly interface. */
extern int func_ov002_021b0c28(int id);
extern char data_ov002_022d016c[];
extern char data_021040ac[];
extern char data_ov002_022cd73c[];
extern char data_ov002_022cf18c[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern char data_ov002_022cd758[];
extern char data_ov002_022cd750[];
extern u16 data_ov002_022ca544[];
#define S(o) (*(int *)(data_ov002_022d016c + (o)))
#define G(o) (*(int *)(data_ov002_022cd73c + (o)))
#define N(o) (*(u32 *)(data_ov002_022cd73c + (o)))
#define CARD(o,i) ((o)==0xde ? ((Player *)(data_ov002_022cd73c+offset))->cards2[i] : ((Player *)(data_ov002_022cd73c+offset))->cards[i])
#define COUNT(sym) (*(u32 *)((sym) + offset))
#define VAL(sym) (*(int *)((sym) + (G(4)&1)*0x868))
int func_ov002_022b0484(int arg)
{
    u32 n, offset;
    switch(arg) {
    case 1: return S(0xd00)==1 ? 0 : S(0xcf0)+1;
    case 4:
        if (func_0201174c() && S(0xd0c)==0 && S(0xd00)!=2) return 1;
        return 0;
    case 5: return S(0xd0c);
    case 3: {
        int result=0;
        int v=*(int *)(data_021040ac+0xb88);
        int ok=1;
        if(v!=1 && v!=2) ok=0;
        if(ok) { if(*(int *)(data_021040ac+0xb9c)==1) result=1; }
        return result;
        /*
        if(*(int *)(data_021040ac+0xb9c)==1) result=1;
        return result; */
    }
    case 8: if(S(0xd08)!=0x1386 && S(0xd08)!=0x1387 && S(0xd08)!=0x1388) break; return 1;
    case 9: if(S(0xd08)!=0x19a3 && S(0xd08)!=0x19a4 && S(0xd08)!=0x19a5) break; return 1;
    case 10: return G(0x228)==3;
    case 11: return G(0x228)==4;
    case 12: return *(int *)(data_ov002_022cf18c + ((G(4)^1)&1)*0x868);
    case 13: return G(0x228)==7;
    case 14: return G(0x228)==6;
    case 15: return G(0x228)==5;
    case 16: return S(0xd08)==0xfbe;
    case 17: return G(0x228)==8;
    case 18: return S(0xd08)==0x10fd;
    case 19: return (u32)(S(0xcf0)+1)<=5;
    case 22: { int v=VAL(data_ov002_022cf16c); int r=0; if(v>1000) return r; if(v>100) r=1; return r; }
    case 23: return VAL(data_ov002_022cf16c)<=100;
    case 24: if(G(0x228)>=9) return 0; return !func_ov002_021b0b0c(0x36);
    case 25: return func_ov002_021b0b0c(0x13)>=20000;
    case 27: { u32 v=VAL(data_ov002_022cf17c); int r=0; if(v>5) return r; if(v) r=1; return r; }
    case 28: return VAL(data_ov002_022cf17c)==0;
    case 29: if(func_ov002_021b0b0c(0x1f)>=50) return 50; return func_ov002_021b0b0c(0x1f);
    case 30: if(func_ov002_021b0b0c(0x21)>=50) return 50; return func_ov002_021b0b0c(0x21);
    case 31: return !func_ov002_021b0b0c(0x39);
    case 32: return !func_ov002_021b0b0c(0x3a);
    case 33: return func_ov002_021b0b0c(0x23);
    case 34: return func_ov002_021b0b0c(0x24);
    case 35: return func_ov002_021b0b0c(0x18);
    case 36: return !func_ov002_021b0b0c(0x19);
    case 55: return func_ov002_021b0b0c(0x3b);
    case 38: return func_ov002_021b0b0c(0);
    case 39: { int v=func_ov002_021b0b0c(3); if(v>func_ov002_021b0b0c(1)) return func_ov002_021b0b0c(3); return func_ov002_021b0b0c(1); }
    case 40: return func_ov002_021b0b0c(0x14);
    case 41: return func_ov002_021b0b0c(5);
    case 45: return func_ov002_021b0b0c(0xf);
    case 46: return func_ov002_021b0b0c(0xd);
    case 37: return func_ov002_021b0b0c(0x25);
    case 47: return func_ov002_021b0b0c(0x26);
    case 48: return func_ov002_021b0b0c(0x28);
    case 49: return func_ov002_021b0b0c(0x29);
    case 50: return func_ov002_021b0b0c(0x2b);
    case 51: return func_ov002_021b0b0c(0x34);
    case 52: if(func_ov002_021b0b0c(0x2e)>=50) return 50; return func_ov002_021b0b0c(0x2e);
    case 53: return func_ov002_021b0b0c(0x31);
    case 54: return func_ov002_021b0b0c(0x32);
    case 21: if(G(0x228)>=9) return 0; return S(0xcec)!=G(4);
    case 42: return func_ov002_021b0b0c(0x37);
    case 43: if(G(0x228)!=1) return 0; if(func_ov002_021b0b0c(4)>0 && func_ov002_021b0b0c(2)==0) return 1; return 0;
    case 44: if(G(0x228)!=1) return 0; if(func_ov002_021b0b0c(2)>0 && func_ov002_021b0b0c(4)==0) return 1; return 0;
    case 20: if(G(0x228)!=1) return 0; return func_ov002_021b0b0c(0x38);
    case 56: return func_ov002_021b0b0c(0x3c);
    case 57: return func_ov002_021b0b0c(0x3d);
    case 102: {
        u32 i;
        offset=G(4)*0x108; if(COUNT(data_ov002_022cd758)!=0) return 0;
        n=COUNT(data_ov002_022cd750); for(i=0;i<n;i++) { if(func_0202e234(CARD(0x20,i))) return 0;
        
            offset=G(4)*0x108; n=((Player *)(data_ov002_022cd73c+offset))->count;
        }
        return 1;
    }
    case 103: {
        u32 i; u32 offset; u32 n; int player=G(4); offset=player*0x108;
        n=COUNT(data_ov002_022cd750); for(i=0;i<n;i++) { if(func_0202b9b0(CARD(0x20,i))==0) return 0;
        
            player=G(4); offset=player*0x108; n=((Player *)(data_ov002_022cd73c+offset))->count;
        }
        offset=(player^1)*0x108; n=COUNT(data_ov002_022cd750);
        for(i=0;i<n;i++) {
            if(func_0202b9b0(CARD(0x20,i))==0) return 1;
            offset=(G(4)^1)*0x108; n=((Player *)(data_ov002_022cd73c+offset))->count;
        }
        return 0;
    }
    case 104: {
        u32 i; offset=G(4)*0x108;
        n=COUNT(data_ov002_022cd750); for(i=0;i<n;i++) { if(func_0202b9b0(CARD(0x20,i))!=3) return 0;
        
            offset=G(4)*0x108; n=((Player *)(data_ov002_022cd73c+offset))->count;
        }
        return 1;
    }
    case 105: {
        int i; int id; int j; Player *p; u32 offset; u32 n;
        offset=G(4)*0x108; n=COUNT(data_ov002_022cd758); for(i=0;(u32)i<n;i++) { 
            p=(Player *)(data_ov002_022cd73c+offset); id=p->cards2[i];
            for(j=i+1;(u32)j<n;j++) { if(func_0202df78(id,p->cards2[j])) return 0; offset=G(4)*0x108; p=(Player *)(data_ov002_022cd73c+offset); n=p->count2; }
        
        }
        n=COUNT(data_ov002_022cd750); for(i=0;(u32)i<n;i++) { 
            id=CARD(0x20,i);
            for(j=i+1;(u32)j<n;j++) { if(func_0202df78(id,CARD(0x20,j))) return 0; offset=G(4)*0x108; n=((Player *)(data_ov002_022cd73c+offset))->count; }
        
        }
        return 1;
    }
    case 106: {
        u32 attr=0; int count=0; u32 i; u16 id;
        offset=G(4)*0x108; n=COUNT(data_ov002_022cd758); for(i=0;i<n;i++) { 
            id=CARD(0xde,i);
            if(func_0202e234(id)) {
                if(attr==0) attr=func_0202b878(id);
                else if(attr!=func_0202b878(id)) return 0;
                count++;
            }
        
            offset=G(4)*0x108; n=((Player *)(data_ov002_022cd73c+offset))->count2;
        }
        n=COUNT(data_ov002_022cd750); for(i=0;i<n;i++) { 
            id=CARD(0x20,i);
            if(func_0202e234(id)) {
                if(attr==0) attr=func_0202b878(id);
                else if(attr!=func_0202b878(id)) return 0;
                count++;
            }
        
            offset=G(4)*0x108; n=((Player *)(data_ov002_022cd73c+offset))->count;
        }
        return count>=8;
    }
    case 107: {
        u32 attr=0; int count=0; u32 i; u16 id;
        offset=G(4)*0x108; n=COUNT(data_ov002_022cd758); for(i=0;i<n;i++) { 
            id=CARD(0xde,i);
            if(func_0202e234(id)) {
                if(attr==0) attr=func_0202b890(id);
                else if(attr!=func_0202b890(id)) return 0;
                count++;
            }
        
            offset=G(4)*0x108; n=((Player *)(data_ov002_022cd73c+offset))->count2;
        }
        n=COUNT(data_ov002_022cd750); for(i=0;i<n;i++) { 
            id=CARD(0x20,i);
            if(func_0202e234(id)) {
                if(attr==0) attr=func_0202b890(id);
                else if(attr!=func_0202b890(id)) return 0;
                count++;
            }
        
            offset=G(4)*0x108; n=((Player *)(data_ov002_022cd73c+offset))->count;
        }
        return count>=8;
    }
    case 108: {
        int bits=0; u32 i;
        offset=G(4)*0x108; n=COUNT(data_ov002_022cd758); for(i=0;i<n;i++) { bits |= 1 << func_0202b8a8(CARD(0xde,i));
        
            offset=G(4)*0x108; n=((Player *)(data_ov002_022cd73c+offset))->count2;
        }
        n=COUNT(data_ov002_022cd750); for(i=0;i<n;i++) { bits |= 1 << func_0202b8a8(CARD(0x20,i));
        
            offset=G(4)*0x108; n=((Player *)(data_ov002_022cd73c+offset))->count;
        }
        return (bits>>1)==0xfff;
    }
    case 109: {
        int count=0; u32 i; int v;
        offset=G(4)*0x108; n=COUNT(data_ov002_022cd758); for(i=0;i<n;i++) { 
            v=func_0202b8a8(CARD(0xde,i)); if(v>1) return 0; if(v==1) count++;
        
            offset=G(4)*0x108; n=((Player *)(data_ov002_022cd73c+offset))->count2;
        }
        n=COUNT(data_ov002_022cd750); for(i=0;i<n;i++) { 
            v=func_0202b8a8(CARD(0x20,i)); if(v>1) return 0; if(v==1) count++;
        
            offset=G(4)*0x108; n=((Player *)(data_ov002_022cd73c+offset))->count;
        }
        return count>=8;
    }
    case 110: {
        u32 i;
        offset=G(4)*0x108; n=COUNT(data_ov002_022cd758); for(i=0;i<n;i++) { if(func_0202e270(CARD(0xde,i))) return 0;
        
            offset=G(4)*0x108; n=((Player *)(data_ov002_022cd73c+offset))->count2;
        }
        n=COUNT(data_ov002_022cd750); for(i=0;i<n;i++) { if(func_0202e270(CARD(0x20,i))) return 0;
        
            offset=G(4)*0x108; n=((Player *)(data_ov002_022cd73c+offset))->count;
        }
        return 1;
    }
    case 26: { int v=VAL(data_ov002_022cf16c); int result=1; if(v!=0x1662 && v!=0x23d) result=0; return result; }
    case 88: return func_ov002_021b0b0c(0x3e);
    }
    if(arg>=0x3a && arg<=0x65) return func_ov002_021b0c28(data_ov002_022ca544[arg-0x3a]);
    return 0;
}
