typedef unsigned int u32;
struct Entry { u32 id:13; u32 flag:1; u32 mid:8; u32 high:8; u32 tail:2; u32 pad; unsigned short active; unsigned short pad2; u32 pad3; u32 flags; };
struct View { char pad[0x38]; unsigned short active; unsigned short pad2; u32 pad3; u32 flags; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021b9bd4(int player, int idx);
extern int func_ov002_021bb91c(int arg0);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern void func_ov002_021d5b80(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021d9144(int arg0, int arg1, int arg2);
extern void func_ov002_021df62c(int arg0, int arg1, int idx);
extern void func_ov002_021e2d94(int arg0, int arg1, int arg2, int arg3);
void func_ov002_02253ea4(int a, int b) {
    int i,j, enabled;
    struct View *p;
    struct Entry *q;
    for(i=0;i<2;i++) {
        p=(struct View *)(data_ov002_022cf16c+(i&1)*0x868);
        q=(struct Entry *)((char *)p+0x30);
        for(j=0;j<5;j++) {
            if(func_ov002_021b9ecc(i,j)==0x1009 && p->active!=0 && (((p->flags>>1)|(p->flags>>2))&1)==0) {
                if(func_ov002_021bb91c(0xff9)!=0) {
                    enabled=((p->flags>>6)&1)==0;
                    if(enabled && ((p->flags>>5)&1)==0) {
                        func_ov002_021df62c(i,j,q->high*2+q->flag);
                        func_ov002_021e2d94(i,j,5,1);
                    }
                    if(i==a && func_ov002_021b9bd4(i,j)<4) {
                        func_ov002_021d9144(i,j,1);
                        if(enabled && b==0) {
                            func_ov002_021df62c(i,j,q->high*2+q->flag);
                            func_ov002_021d59cc(i,j,0x1009,3,0);
                        }
                    }
                } else {
                    func_ov002_021e2d94(i,j,5,0);
                    func_ov002_021d5b80(i,j,0x1009,1);
                    func_ov002_021d9144(i,j,0);
                }
            }
            p=(struct View *)((char *)p+20);
            q++;
        }
    }
}

