typedef struct { int key, val, pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Obj;
typedef union { unsigned short raw; struct { unsigned short player:1, type:5, sub:8, rest:2; } b; } Packed;
typedef struct { char pad[0xc]; int id; short pad2[2]; short values[6]; } Result;
typedef struct { signed char active; char pad[11]; int id; } Card;
typedef struct { int active,id; } Effect;
typedef struct { Obj *obj; char pad[0xc50]; int c54,c58,pad5c,state,timer; Packed packed; char pad6a[0x16]; int c80; char pad84[0x44]; int cc8; char padcc[0x48]; int id,d18,d1c,d20,d24,d28,d2c,d30; } State;
extern char data_ov002_022d1410[],data_ov002_022ccfd8[],data_ov002_022ccfec[];
extern int data_ov002_022d1af8[],data_ov002_022cd73c[],data_ov002_022d0f2c[];
extern Effect data_ov002_022d28fc[];
extern void *func_ov002_022a6324(char *base,int idx,int type,int sub);
extern int func_ov002_022b94b8(int,int,int,int,int);
extern int func_ov002_022b9420(int,int,int,int,int);
extern int func_02021660(Obj *o,int key,int idx);
extern void func_020216b0(void *p,int unused1,int unused2);
extern int func_0202224c(int idx);
extern int func_0202e310(int unused0);
extern int func_02037208(int,int,int,int);
extern int func_02037dc0(int,int,int);
extern int func_020a978c(char *,const char *,...);
extern int func_ov002_022bdb88(Effect *,int,int,void *,int);
static inline int special(int id) {
    int yes=1;
    if((unsigned)(id-0x1386)>2 && (unsigned)(id-0x19a3)>2) yes=0;
    return yes;
}
static inline int active(Effect *e) {
    int i;
    for(i=0;i<16;i++,e++) {
        if(e->active && e->id==0x41) return 1;
    }
    return 0;
}
int func_ov002_022b95cc(State *s) {
    switch(s->state) {
    case 0: {
        Packed p=s->packed;
        int type=p.b.type;
        int player=p.b.player;
        Card *c=func_ov002_022a6324(data_ov002_022d1410,player,type,p.b.sub);
        data_ov002_022d1af8[1]=0;
        s->id=c->active ? c->id : 0xfe0;
        s->d18=0; s->d1c=0;
        s->d20=func_ov002_022b94b8((int)s,s->id,0,player,type) ? 1:0;
        s->d24=0; s->d28=0; s->d2c=0;
        s->d30=s->c58==2 ? 1:0;
        s->state=1; s->timer=0;
        break;
    }
    case 1: {
        Effect *e=data_ov002_022d28fc;
        int enabled,msg;
        if(s->timer<15) break;
        if(s->c58==2) enabled=s->packed.b.player!=data_ov002_022cd73c[1] ? 1:0;
        else if(func_0202e310(s->id)) enabled=s->d20 ? 1:0;
        else enabled=0;
        if(s->c58==2) msg=0x41;
        else if(special(s->id)) msg=0x1d;
        else if(func_0202e310(s->id)) msg=0x10;
        else if(s->c58==1) msg=0x3b;
        else msg=0x3e;
        func_ov002_022bdb88(e,msg,enabled,&s->c80,0);
        if(s->c58==2) {
            func_020a978c((char *)s+0x924,data_ov002_022ccfd8,s->id);
            func_020a978c((char *)s+0x94c,data_ov002_022ccfec);
            s->state=5; s->timer=0;
        } else { s->state=2; s->timer=0; }
        break;
    }
    case 2: {
        int delay;
        Result *result;
        if(special(s->id)) delay=0x48;
        else if(func_0202e310(s->id)) delay=0x18;
        else if(s->c58==1) delay=0x12;
        else delay=0x18;
        if(s->timer==30 && s->d20) {
            if(s->id==0x1386 || s->id==0x1387 || s->id==0x1388 || (unsigned)(s->id-0x19a3)<=2)
                func_02037208(0x4f,-1,0,1);
        }
        if(s->timer==delay-16) {
            if(s->d20 && s->id!=0x1386 && s->id!=0x1387 && s->id!=0x1388 && s->id!=0x19a3 && s->id!=0x19a4 && s->id!=0x19a5)
                func_02037dc0(data_ov002_022d0f2c[0x36],0,15);
        }
        if(s->timer<delay) break;
        result=(Result *)func_ov002_022b94b8((int)s,s->id,0,s->packed.b.player,s->packed.b.type);
        if(!result) func_ov002_022b9420((int)s,s->id,1,s->packed.b.player,s->packed.b.type);
        if(result) {
            void *obj=(void *)func_02021660(s->obj,1,0);
            int msg;
            func_020216b0(obj,6,result->values[0]);
            func_020216b0(obj,7,result->values[1]);
            func_020216b0(obj,8,result->values[2]);
            func_020216b0(obj,9,result->values[3]);
            func_020216b0(obj,10,result->values[4]);
            func_020216b0(obj,11,result->values[5]);
            if(s->id!=0x1386 && s->id!=0x1387 && s->id!=0x1388 && s->id!=0x19a3 && s->id!=0x19a4 && s->id!=0x19a5)
                func_02037208(0x28,-1,0,1);
            msg=-1;
            switch(s->id) {
            case 0x129e: msg=0x40; break;
            case 0x1386: msg=0x42; break;
            case 0x1387: msg=0x43; break;
            case 0x1388: msg=0x44; break;
            case 0x154b: msg=0x45; break;
            case 0x19a3: msg=0x46; break;
            case 0x19a4: msg=0x47; break;
            case 0x19a5: msg=0x48; break;
            }
            if(msg>=0) func_ov002_022bdb88(data_ov002_022d28fc,msg,0,&s->c80,0);
            s->d1c=1; s->d18=1; s->state=3; s->timer=0;
        } else {
            func_02037208(s->c58==0 ? 0x4c:0x4d,-1,0,1);
            s->d24=1; s->d28=1; s->state=4; s->timer=0;
        }
        break;
    }
    case 3:
        if((unsigned)(s->id-0x1386)<=2) {
            if(s->timer==14) func_02037dc0(data_ov002_022d0f2c[0x36],0,15);
            else if(s->timer==30) func_02037208(0x29,-1,0,1);
        }
        if((unsigned)(s->id-0x19a3)<=2 && s->timer==1) {
            func_02037dc0(data_ov002_022d0f2c[0x36],0,15);
            func_02037208(0x2f,-1,0,1);
        }
        if(!(func_0202224c(1)&2)) {
            func_02037dc0(data_ov002_022d0f2c[0x36],0x7f,15);
            s->d18=0; s->state=6; s->timer=0;
        }
        break;
    case 4: {
        int delay=func_0202e310(s->id) ? 0x3c:0x24;
        if(s->timer>=delay) { s->state=6; s->timer=0; }
        break;
    }
    case 5: {
        Effect *e=data_ov002_022d28fc;
        int i,found;
        if(s->timer==16) { s->d2c=1; func_02037208(0x4d,-1,0,1); }
        else if(s->timer==63) s->d2c=0;
        else if(s->timer==75) { s->d30=0; func_02037208(0x92,-1,0,1); }
        found=active(e);
        if(!found) { s->state=6; s->timer=0; }
        break;
    }
    case 6:
        data_ov002_022d1af8[1]=1;
        s->cc8=12; s->c54=0; s->d24=0; s->d28=0; s->d2c=0; s->d30=0;
        return 0;
    }
    s->timer++;
    return 1;
}

