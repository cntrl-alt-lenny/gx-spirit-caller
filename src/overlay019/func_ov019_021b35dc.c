typedef unsigned short u16;
typedef struct { u16 x,y; unsigned char w,h; } Rect;
typedef struct { u16 id,pad; int value; u16 kind,pad2; } Entry;
typedef struct { int a,b,count,start,sel; Entry entries[88]; int mode,drag,last; } List;
typedef struct { int a,pos,b,c,d,e,event; } Scroll;
extern u16 data_02104bac[];
extern Scroll data_ov000_021b1d4c;
extern Rect data_ov019_021b5ba0,data_ov019_021b5baa;
extern int func_02037208(int,int,int,int);
extern int func_ov005_021aa4d0(Scroll *);
extern int func_ov019_021b27a0(Rect *);
extern int func_ov019_021b3cf0(List *,int);
extern void func_ov019_021b40d4(int,int,int);
extern int func_ov019_021b4258(int *);
extern int func_ov019_021b4324(char *);
/* Integer remainder uses the compiler's signed divmod runtime, func_020b3870. */
extern long long func_020b3870(int,int);
#define SOUND(n) func_02037208(n,-1,0,1)
#define DRAW(n,k) func_ov019_021b40d4((int)p,p->entries[(int)(func_020b3870((n),p->count)>>32)].id,(k)%8)
#define UPDATE() func_ov019_021b4258((int *)p)
#define CHANGE() func_ov019_021b3cf0(p,2)
int func_ov019_021b35dc(List *p) {
    Scroll *s=&data_ov000_021b1d4c;
    int i,old,n;
    unsigned int planes;
    planes=(*(volatile unsigned int *)0x04000000 & 0x1f00)>>8;
    *(volatile unsigned int *)0x04000000 = (*(volatile unsigned int *)0x04000000 & ~0x1f00) | ((planes | 6)<<8);
    if(data_02104bac[0x29]) {
        if(data_02104bac[0x29]&0x300) { planes=(*(volatile unsigned int *)0x04000000 & 0x1f00)>>8; *(volatile unsigned int *)0x04000000 = (*(volatile unsigned int *)0x04000000 & ~0x1f00) | ((planes & ~6)<<8); }
        if(p->mode>0) {
            if(data_02104bac[0x2a]&1) return func_ov019_021b3cf0(p,2-p->mode);
            else if(data_02104bac[0x2a]&2) { p->mode=0; SOUND(0x42); }
            else if(data_02104bac[0x2a]&0x30) { p->mode=2-(p->mode-1); SOUND(0x38); }
            else if(data_02104bac[0x2b]&0x80) { p->mode=0; SOUND(0x42); }
            else if(data_02104bac[0x2b]&0x40) { p->mode=0; SOUND(0x42); }
        } else {
            if(data_02104bac[0x2a]&1) { p->mode=1; SOUND(0x3a); }
            else if(data_02104bac[0x2a]&2) return func_ov019_021b3cf0(p,0);
            else if(data_02104bac[0x2b]&0x80) {
                if(p->sel<(p->count>6?6:p->count)-1) {
                    p->sel++; p->last=p->sel; SOUND(0x38); CHANGE();
                } else if(p->start+6<p->count) {
                    p->start++; n=p->start+6; DRAW(n,n); UPDATE(); SOUND(0x38); CHANGE();
                }
            } else if(data_02104bac[0x2b]&0x40) {
                if(p->sel>0) { p->sel--; p->last=p->sel; SOUND(0x38); CHANGE(); }
                else if(p->start>0) {
                    p->start--; n=p->start;
                    if(n-1>=0) { DRAW(n-1,n+7); }
                    UPDATE(); SOUND(0x38); CHANGE();
                }
            } else if(data_02104bac[0x2b]&0x10) {
                if(p->start+6<p->count) {
                    p->start+=6;
                    if(p->start+6>=p->count) p->start=p->count-6;
                    for(i=0;i<6;i++) { n=p->start+i+1; DRAW(n,n); }
                    UPDATE(); SOUND(0x38); CHANGE();
                }
            } else if(data_02104bac[0x2b]&0x20) {
                if(p->start>0) {
                    p->start-=6; if(p->start<0) p->start=0;
                    for(i=0;i<6;i++) { n=p->start; if(n-1+i>=0) { DRAW(n-1+i,n+i+7); } }
                    UPDATE(); SOUND(0x38); CHANGE();
                }
            }
        }
    } else {
        if(func_ov019_021b27a0(&data_ov019_021b5ba0)) return func_ov019_021b3cf0(p,0);
        if(func_ov019_021b27a0(&data_ov019_021b5baa)) return func_ov019_021b3cf0(p,1);
        if(p->count>6) {
            old=p->start;
            func_ov005_021aa4d0(s);
            p->start=s->pos;
            switch(s->event) {
            case 0:
                if(p->drag) { p->drag=0; p->mode=0; SOUND(0x38); CHANGE(); return 0; }
                break;
            case 2:
                n=p->start; if(n-1>=0) { DRAW(n-1,n+7); }
                p->drag=2; return 0;
            case 3:
                n=p->start+6; DRAW(n,n); p->drag=3; return 0;
            case 4:
                for(i=0;i<6;i++) { n=p->start; if(n-1+i>=0) { DRAW(n-1+i,n+i+7); } }
                p->drag=4; return 0;
            case 5:
                for(i=0;i<6;i++) { n=p->start+i+1; DRAW(n,n); }
                p->drag=5; return 0;
            case 1:
                if(old!=p->start) {
                    for(i=0;i<8;i++) { n=p->start; if(n-1+i>=0) { DRAW(n-1+i,n+i+7); } }
                }
                p->drag=1; return 0;
            }
        }
        n=func_ov019_021b4324((char *)p);
        if(n>=0 && n!=p->sel) { p->sel=n; p->mode=0; SOUND(0x38); CHANGE(); }
    }
    return 0;
}


