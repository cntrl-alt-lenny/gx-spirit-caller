typedef struct { int x,y; } Point;
typedef struct { char pad[4]; unsigned short f_4; } arg0_0229d2ec_t;
typedef struct { unsigned short a:1,b:5,c:8,d:1,e:1; } Bits;
typedef struct { signed char active, speed, angle, view; short status,x,y; Bits flags; int key,fade; } Node;
extern struct { int pad, side; } data_ov002_022cd73c;
extern char data_ov002_022d1410[];
extern void func_ov002_0229d2ec(arg0_0229d2ec_t *p);
extern void func_ov002_022a6e04(Point *, char *, int, int, int);
extern int func_020b3870(int, int);
void func_ov002_0229d32c(Node *p) {
    Point cp, cp0, out, out0;
    if (p->active == 0) return;
    if (p->status == 8) {
        if (((((((p->flags.a == (data_ov002_022cd73c.side ^ 1))*2 - p->flags.e)&3)<<3) - p->angle)&31) == 16) p->speed = 1;
        p->status--;
        return;
    }
    if (p->status != 0) {
        int angle;
        if (p->view != (p->flags.d << 3)) p->view = (p->view + 1)&15;
        angle = (((p->flags.a == (data_ov002_022cd73c.side ^ 1))*2 - p->flags.e)&3)<<3;
        if (p->angle != angle) {
            if (((angle-p->angle)&31) <= 16) p->angle = (p->angle+1+p->speed)&31;
            else p->angle = (p->angle-1-p->speed)&31;
        }
        func_ov002_022a6e04(&out,data_ov002_022d1410,p->flags.a,p->flags.b,p->flags.c);
        cp=out;
        p->x=cp.x+func_020b3870(p->status*(p->x-cp.x),p->status+1);
        p->y=cp.y+func_020b3870(p->status*(p->y-cp.y),p->status+1);
        p->status--;
        if (p->status == 0) func_ov002_0229d2ec((arg0_0229d2ec_t *)p);
    } else {
        p->view=p->flags.d<<3;
        p->angle=(((p->flags.a == (data_ov002_022cd73c.side ^ 1))*2-p->flags.e)&3)<<3;
        func_ov002_022a6e04(&out0,data_ov002_022d1410,p->flags.a,p->flags.b,p->flags.c);
        cp0=out0;
        p->x=cp0.x;
        p->y=cp0.y;
        if (p->fade != 0) p->fade--;
    }
}

