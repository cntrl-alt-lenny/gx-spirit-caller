typedef struct { unsigned short player:1,type:5,sub:8,rest:2; } Input;
typedef struct { char pad[8]; int f8; } Self;
typedef struct { char pad[4]; int f4; } S022aafe4;
typedef struct { signed char active; char pad[9]; unsigned short player:1,padbit:13,flag:1,rest:1; int id; } Entry;
typedef struct { unsigned int :13; unsigned int low:1; unsigned int :8; unsigned int high:8; unsigned int :2; } Packed;
typedef struct { char pad[0x120]; Packed packed[256]; char tail[840]; } PlayerPacked;
typedef struct { int value; char pad[16]; } ValueSlot;
typedef struct { ValueSlot slots[11]; char tail[1932]; } PlayerValues;
typedef struct { unsigned short active; char pad[18]; } FlagSlot;
typedef struct { FlagSlot slots[11]; char tail[1932]; } PlayerFlags;
extern struct { int f0; unsigned int :3; unsigned int mode:2; unsigned int :27; } data_02104f4c;
extern struct { char pad[0x90]; Input input; } data_ov002_022d1910;
extern char data_ov002_022d1410[];
extern struct { char pad[0xd04]; int f; } data_ov002_022d016c;
extern struct { int f0,f4; } data_ov002_022cd73c;
extern struct { char pad[0xd0]; int f; } data_ov002_022d0f2c;
extern struct { char pad[0x10]; int f; } data_ov002_022d11bc;
extern char data_ov002_022cf16c[],data_ov002_022cf1a4[],data_ov002_022cf1a8[];
extern struct { char pad[0x38]; unsigned int f; } data_021040ac;
extern unsigned int func_0202b878(int id),func_0202b890(int id),func_0202b8a8(int id),func_0202b8c0(int id);
extern int func_0202b950(int unused0),func_0202b980(int unused0),func_0202e234(int x);
extern void *func_0208e200(void);
extern int func_ov002_021b9bd4(int player,int idx),func_ov002_021b9dd4(int arg0,int arg1),func_ov002_021b9e00(int arg0,int arg1),func_ov002_021b9e48(int arg0,int arg1);
/* The original supplies only r0 and r1 to this four-parameter thunk. */
extern int func_ov002_021b9e90();
extern int func_ov002_021c38c4(int side,int index);
extern void func_ov002_021c4c9c(int player,int index,int *out);
extern int func_ov002_021c84f0(int player,int index,int mode);
extern void *func_ov002_022a6324(char *base,int idx,int type,int sub);
extern void func_ov002_022aaf38(void *arg0,int player);
extern void func_ov002_022aaf8c(Self *self,int arg1);
extern void func_ov002_022aafe4(S022aafe4 *arg0,int arg1);
extern void func_ov002_022ab038(void *self,int val);
extern void func_ov002_022ab0a4(int *self,unsigned int value);
extern void func_ov002_022ab294(int *self,Input *input);
void func_ov002_022ab3e4(int *self) {
    int id,remaining,band;
    unsigned short *top,*bottom;
    int width,count,color,value,temp;
    int defcolor,defense;
    Entry *entry;
    Input input;
    band=(int)data_02104f4c.mode/2 ? 22:0;
    input=data_ov002_022d1910.input;
    id=0;
    entry=func_ov002_022a6324(data_ov002_022d1410,input.player,input.type,input.sub);
    if(entry && entry->active) {
        struct { unsigned short player:1,pad:13,flag:1,rest:1; } flags,other;
        *(unsigned short *)&flags=*(unsigned short *)((char *)entry+10);
        if(flags.flag || data_ov002_022d016c.f==3 || (other=flags,data_ov002_022cd73c.f4==other.player))id=entry->id;
    }
    if(data_ov002_022d0f2c.f==2 && data_ov002_022d11bc.f>0) {
        id=data_ov002_022d11bc.f; input.type=16;
    }
    switch(input.type) {
    case 12: case 13: case 14: case 15:
        func_ov002_022ab294(self,&input); return;
    }
    if(id>1) {
        remaining=32;
        top=(unsigned short *)func_0208e200()+(band*32+31);
        bottom=(unsigned short *)func_0208e200()+((band+1)*32+31);
        if(input.type+input.sub<=4 || func_0202e234(id)) {
            if(self[8]!=0 || (unsigned short)id!=(unsigned short)self[0]) {
                if(input.type+input.sub<=4) {
                    func_ov002_021c4c9c(input.player,input.type+input.sub,self+9);
                    self[20]=func_ov002_021c84f0(input.player,input.type+input.sub,1);
                } else {
                    self[9]=id;
                    self[14]=(short)func_0202b950(id);
                    self[15]=(short)func_0202b980(id);
                    self[16]=self[14]; self[17]=self[15];
                    self[13]=func_0202b8a8(id); self[20]=self[13];
                    self[11]=func_0202b890(id); self[10]=func_0202b878(id);
                    if(input.type==11) {
                        Packed *p=((PlayerPacked *)data_ov002_022cf16c)[input.player&1].packed;
                        self[13]=func_ov002_021c38c4(input.player,p[input.sub].high*2+p[input.sub].low);
                    }
                }
                value=self[14]; if(value>99999)value=99999; self[14]=value;
                value=self[15]; if(value>99999)value=99999; self[15]=value;
                self[8]=0;
            }
            func_ov002_022ab0a4(self,(unsigned short)self[9]|((unsigned short)((self[9]!=id)<<1)<<16));
            temp=self[15];value=self[14];
            width=((value>temp?value:temp)>=10000)+4;
            if(value>self[16])color=2; else if(value<self[16])color=3; else color=1;
            count=0;
            if(value<0){*top--=(color<<12)|0x9e;count++;}
            else { do { *top--=(value%10+0x91)|(color<<12); value/=10; count++; } while(value); }
            while(count++<width)*top--=0;
            *top=0x4089;
            remaining-=width+1;
            temp=self[17];defense=self[15];
            if(defense>temp)defcolor=2; else if(defense<temp)defcolor=3; else defcolor=1;
            count=0;
            if(defense<0){*bottom--=(defcolor<<12)|0x9e;count++;}
            else { do { *bottom--=(defense%10+0x91)|(defcolor<<12); defense/=10; count++; } while(defense); }
            while(count++<width)*bottom--=0;
            *bottom=0x408a;
            if(self[13]>self[20])color=2; else if(self[13]<self[20])color=3; else color=1;
            top[-1]=0x408b; bottom[-1]=(self[13]+0x91)|(color<<12);
            func_ov002_022aafe4((S022aafe4 *)self,self[11]);
            remaining-=3;
            top[-3]=0x4081;top[-2]=0x4082;bottom[-3]=0x4083;bottom[-2]=0x4084;
            top-=4;bottom-=4;
            if(self[10]!=0 && self[10]<=21) {
                func_ov002_022aaf38(self,self[10]);remaining-=2;
                top[-1]=0x407d;*top=0x407e;top-=2;bottom[-1]=0x407f;*bottom=0x4080;bottom-=2;
            }
        } else {
            if(id==0x1368 && (data_021040ac.f&0x40) && (temp=((PlayerValues *)data_ov002_022cf1a8)[input.player&1].slots[input.type+input.sub].value)!=0)
                func_ov002_022ab0a4(self,(unsigned short)temp|0x30000);
            else func_ov002_022ab0a4(self,id);
            func_ov002_022aafe4((S022aafe4 *)self,func_0202b890(id));
            top[-1]=0x4081;*top=0x4082;top-=2;bottom[-1]=0x4083;*bottom=0x4084;bottom-=2;
            remaining-=2;
            temp=func_0202b8c0(id);
            if(temp) {
                func_ov002_022aaf8c((Self *)self,temp);remaining-=2;
                top[-1]=0x407d;*top=0x407e;top-=2;bottom[-1]=0x407f;*bottom=0x4080;bottom-=2;
            }
        }
        if(input.type<=10 && ((PlayerFlags *)data_ov002_022cf1a4)[input.player&1].slots[input.type].active) {
            temp=0;
            switch((unsigned short)self[0]) {
            case 0x1357:case 0x1358:case 0x14cc:case 0x14d1:
                temp=((PlayerValues *)data_ov002_022cf1a8)[input.player&1].slots[input.type].value;
                if(temp)temp+=7;break;
            case 0x145b:case 0x171f:case 0x197d:case 0x1a19:
                temp=((PlayerValues *)data_ov002_022cf1a8)[input.player&1].slots[input.type].value;break;
            }
            if(temp) {
                func_ov002_022ab038(self,temp);remaining-=2;
                top[-1]=0x4085;*top=0x4086;top-=2;bottom[-1]=0x4087;*bottom=0x4088;bottom-=2;
            }
            value=func_ov002_021b9bd4(input.player,input.type);
            if(value>=0) {
                *top--=0x408c;
                *bottom--=(unsigned short)(value%10+0x91)|0x1000;
                remaining--;
                value/=10;
                while(value) {
                    *top--=0;*bottom--=(unsigned short)(value%10+0x91)|0x1000;
                    remaining--;value/=10;
                }
            }
            value=func_ov002_021b9dd4(input.player,input.type);
            if(value!=0) {
                *top--=0x4090;
                *bottom--=(unsigned short)(value%10+0x91)|0x1000;
                remaining--;
                value/=10;
                while(value) {
                    *top--=0;*bottom--=(unsigned short)(value%10+0x91)|0x1000;
                    remaining--;value/=10;
                }
            }
            value=func_ov002_021b9e00(input.player,input.type);
            if(value!=0) {
                *top--=0x408d;
                *bottom--=(unsigned short)(value%10+0x91)|0x1000;
                remaining--;
                value/=10;
                while(value) {
                    *top--=0;*bottom--=(unsigned short)(value%10+0x91)|0x1000;
                    remaining--;value/=10;
                }
            }
            value=func_ov002_021b9e48(input.player,input.type);
            if(value!=0) {
                *top--=0x408e;
                *bottom--=(unsigned short)(value%10+0x91)|0x1000;
                remaining--;
                value/=10;
                while(value) {
                    *top--=0;*bottom--=(unsigned short)(value%10+0x91)|0x1000;
                    remaining--;value/=10;
                }
            }
            value=func_ov002_021b9e90(input.player,input.type);
            if(value!=0) {
                *top--=0x408f;
                *bottom--=(unsigned short)(value%10+0x91)|0x1000;
                remaining--;
                value/=10;
                while(value) {
                    *top--=0;*bottom--=(unsigned short)(value%10+0x91)|0x1000;
                    remaining--;value/=10;
                }
            }
        }
        if(self[7]==remaining)return;
        self[7]=remaining;self[5]=0;self[6]=-1;
    } else func_ov002_022ab0a4(self,0);
}
