typedef struct { int f0,f4,f8,fc; } Req;
typedef struct { int f0,f4; } Out;
typedef struct { unsigned short count; } state_0201ef3c_t;
typedef struct { int unused; unsigned int mode:3; unsigned int:29; } System;
extern System data_02104f4c;
extern char data_ov019_021b5cb4[], data_ov019_021b5ccc[], data_ov019_021b5ce4[], data_ov019_021b5cfc[];
extern char data_ov019_021b5d14[], data_ov019_021b5d2c[], data_ov019_021b5d44[], data_ov019_021b5d5c[];
extern char data_ov019_021b5d74[], data_ov019_021b5d8c[], data_ov019_021b5da4[], data_ov019_021b5dbc[];
extern int data_ov019_021b6834[];
extern void func_0201e7e0();
extern int func_0201ede4(int arg0,int arg1);
extern void func_0201ef3c(state_0201ef3c_t *p,void **tasks1,void **tasks2);
extern void func_0201ef90(int *a0,int *a1,int *a2,int a3,int s0,int s1,Req *r,int s3,int s4,Out *out);
extern int OS_SPrintf(char *buffer,const char *format,...);
extern int func_ov019_021b4ed0(int a0,int a1);
extern int func_ov019_021b4f1c(char *a0);
void func_ov019_021b4fdc(char *self) {
    char d[64], c[64], b[64], a[64];
    Req req={(int)a,(int)b,(int)c,(int)d};

    int tmp;
    int id=func_ov019_021b4f1c(self);
    if(id==0x37) {
        if(data_02104f4c.mode==0) {
            OS_SPrintf((char *)req.f0,data_ov019_021b5cb4,id);
            OS_SPrintf((char *)req.f4,data_ov019_021b5ccc,id);
            OS_SPrintf((char *)req.f8,data_ov019_021b5ce4,id);
            OS_SPrintf((char *)req.fc,data_ov019_021b5cfc,id);
        } else {
            OS_SPrintf((char *)req.f0,data_ov019_021b5d14,id);
            OS_SPrintf((char *)req.f4,data_ov019_021b5d2c,id);
            OS_SPrintf((char *)req.f8,data_ov019_021b5d44,id);
            OS_SPrintf((char *)req.fc,data_ov019_021b5d5c,id);
        }
    } else {
        OS_SPrintf((char *)req.f0,data_ov019_021b5d74,id);
        OS_SPrintf((char *)req.f4,data_ov019_021b5d8c,id);
        OS_SPrintf((char *)req.f8,data_ov019_021b5da4,id);
        OS_SPrintf((char *)req.fc,data_ov019_021b5dbc,id);
    }
    if(*(int *)(self+0x54)!=0) {
        func_0201ef3c(*(state_0201ef3c_t **)self,(void **)(self+8),(void **)(self+0x54));
        *(int *)(self+0x58)=0;
        *(int *)(self+0x54)=0;
    }
    {
    func_0201e7e0();
    func_0201ef90((int *)self,(int *)(self+4),(int *)(self+8),0x1e00,1,1,&req,1,-1,(Out *)(self+0x54));
    data_ov019_021b6834[0]=func_0201ede4((int)&tmp,req.fc);
    }
    *(int *)(self+0xbc)=0;
    if(func_ov019_021b4ed0((int)self,id)==0) return;
    switch(id) {
    case 1:
        OS_SPrintf((char *)req.f0,data_ov019_021b5d74,0x5c);
        OS_SPrintf((char *)req.f4,data_ov019_021b5d8c,0x5c);
        OS_SPrintf((char *)req.f8,data_ov019_021b5da4,0x5c);
        OS_SPrintf((char *)req.fc,data_ov019_021b5dbc,0x5c);
        break;
    case 0x4b:
        OS_SPrintf((char *)req.f0,data_ov019_021b5d74,0x5d);
        OS_SPrintf((char *)req.f4,data_ov019_021b5d8c,0x5d);
        OS_SPrintf((char *)req.f8,data_ov019_021b5da4,0x5d);
        OS_SPrintf((char *)req.fc,data_ov019_021b5dbc,0x5d);
        break;
    default: return;
    }
    if(*(int *)(self+0xb0)!=0) {
        func_0201ef3c(*(state_0201ef3c_t **)(self+0x5c),(void **)(self+0x64),(void **)(self+0xb0));
        *(int *)(self+0xb4)=0;
        *(int *)(self+0xb0)=0;
    }
    {
    func_0201e7e0();
    func_0201ef90((int *)(self+0x5c),(int *)(self+0x60),(int *)(self+0x64),0,0,1,&req,1,-1,(Out *)(self+0xb0));
    data_ov019_021b6834[1]=func_0201ede4((int)(unsigned long)&tmp,req.fc);
    }
}




