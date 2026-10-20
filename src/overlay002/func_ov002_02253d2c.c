typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
struct Entry { u32 id:13; u32 flag:1; u32 mid:8; u32 high:8; u32 tail:2; u32 pad; u16 active; u16 pad2; u32 pad3; u32 flags; };
struct View { char pad[0x38]; u16 active; u16 pad2; u32 pad3; u32 flags; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1ac[];
extern int func_ov002_021b34f4(int row_sel, int col_idx, int lo_want, int hi_want);
extern int func_ov002_021b9bd4(int player, int idx);
/* The original supplies only r0 and r1 to this thunk. */
extern int func_ov002_021c8940();
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern int func_ov002_021d9144(int arg0, int arg1, int arg2);
extern void func_ov002_021df62c(int arg0, int arg1, int idx);
void func_ov002_02253d2c(int a, int b, int c) {
    int pair;
    int i, j;
    struct Entry *q;
    struct View *p;
    int index=b*20;
    int offset=(a&1)*0x868;
    u32 flags=(u32)data_ov002_022cf1ac+offset;
    if (((*(u32 *)(flags+index)>>5)&1)==0) return;
    if (func_ov002_021b9bd4(a,b)>=4) return;
    func_ov002_021d9144(a,b,1);
    if(c!=0) return;
    if(((*(u32 *)(flags+index)>>6)&1)!=0) return;
    q=(struct Entry *)(data_ov002_022cf16c+offset+0x30);
    func_ov002_021df62c(a,b,((struct Entry *)((char *)q+index))->high*2+((struct Entry *)((char *)q+index))->flag);
    pair=(u16)((u8)a|((u8)b<<8));
    for(i=0;i<2;i++) {
        p=(struct View *)(data_ov002_022cf16c+(i&1)*0x868);
        q=(struct Entry *)((char *)p+0x30);
        for(j=0;j<5;j++) {
            if(q->id!=0 && p->active!=0 && (((p->flags>>1)|(p->flags>>2))&1)==0 && func_ov002_021c8940(i,j)==2 && func_ov002_021b34f4(i,j,a,b)!=0) {
                func_ov002_021d59cc(i,j,pair,7,0);
            }
            q++;
            p=(struct View *)((char *)p+20);
        }
    }
}






