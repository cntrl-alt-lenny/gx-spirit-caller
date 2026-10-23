typedef struct { int a,b,c; } Header;
typedef struct { Header header; unsigned rank; char pad[0x38]; int active; int value; unsigned char x,y,z,pad2; } Record;
typedef struct { char pad[0x3cd0]; int changed; char pad2[0x54]; Record rec[60]; } State;
extern State data_ov004_0220b500;
extern Record data_ov004_0220f228[];
extern void *func_02034344(void);
extern void func_02034360(void);
extern void *func_0203268c(void);
extern int func_02032f38(char *self,int a1,int a2);
extern int func_02052cdc(void *a,void *b);
extern void func_02094688(const void *src,void *dst,unsigned size);
extern void func_020945f4(void *p,int val,int size);
void func_ov004_021d6468(Record *out) {
    unsigned char *map=func_02034344();
    int i;
    int count=0;
    State *base=&data_ov004_0220b500;
    State *p=base;
    Record *q=data_ov004_0220f228;
    for(i=0;i<60;p=(State *)((char *)p+0x54),q++,i++) {
        if(map && map[i]) {
            Record *dst;
            State *other=(State *)((char *)base+(map[i]-1)*0x54);
            p->rec[0].active=0;
            if(p->rec[0].rank>other->rec[0].rank) {
                dst=&other->rec[0];
                Header tmp=dst->header;
                p->rec[0].x+=other->rec[0].x;
                p->rec[0].y+=other->rec[0].y;
                p->rec[0].z+=other->rec[0].z;
                func_02094688(q,dst,0x54);
                dst->header=tmp;
                other->rec[0].active=1;
            } else {
                other->rec[0].x+=p->rec[0].x;
                other->rec[0].y+=p->rec[0].y;
                other->rec[0].z+=p->rec[0].z;
            }
            base->changed=1;
        } else if(func_0203268c()) {
            func_02032f38(func_0203268c(),count,(int)q);
            count++;
        }
    }
    {
    State *scan=base;
    for(i=0;i<60;i++,scan=(State *)((char *)scan+0x54)) {
        if(!scan->rec[0].active) {
            for(count=i;count<59;count++) func_02094688(&base->rec[count+1],&base->rec[count],0x54);
            func_020945f4(&base->rec[count],0,0x54);
        }
    }
    }
    func_02034360();
    if(out==0) return;
    for(i=0;i<60;i++) {
        if(func_02052cdc(out,&base->rec[i])) {
            out->x=base->rec[i].x;
            out->y=base->rec[i].y;
            out->z=base->rec[i].z;
            out->value=base->rec[i].value;
            func_02094688(out,&base->rec[i],0x54);
            return;
        }
    }
}




