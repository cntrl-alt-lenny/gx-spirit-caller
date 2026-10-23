typedef unsigned short u16;
typedef struct {
    void *resource;
    int unk4, unk8, position;
    short offset;
    u16 unk12;
    unsigned short mode:4, enabled:1, rest14:11;
    unsigned short rest16:14, flag14:1, flag15:1;
    unsigned int x:7, y:7, layer:3, rest18:15;
    unsigned int a:8, b:8, rest1c:16;
    int unk20;
    unsigned short left:8, top:8;
    unsigned short width:8, height:8;
} Obj;
typedef struct { int f0,f4,f8,fc; } Req;
typedef struct { int f0,f4; } Out;
struct Entry { u16 id,pad; int value; u16 kind,pad2; };
struct List { int unk0,unk4,count,unkC,unk10; struct Entry entries[96]; };
extern char data_ov019_021b5e70[], data_ov019_021b5bd0[], data_ov019_021b5bf0[], data_ov019_021b5c0c[], data_ov019_021b5c2c[], data_ov019_021b5c4c[], data_ov019_021b6848[], data_ov019_021b6920[];
extern const Req data_ov019_021b5a18;
extern void func_02094504(int,void *,unsigned int);
extern void func_0208c884(u16 *,int);
extern void func_ov019_021b3f7c(struct List *);
extern int func_0201d47c(Obj *);
extern void *func_02006c0c(void *,int,int);
extern void func_0201e5b8(Obj *);
extern void Task_Invoke(void *);
extern void func_0201e7e0(void);
extern void func_0201ef90(int *,int *,int *,int,int,int,Req *,int,int,Out *);
extern void func_02001bc8(u16 *,u16,u16);
extern void func_02094550(int *,int *,unsigned int);
extern void func_ov019_021b40d4(int,int,int);
extern int func_ov019_021b4258(int *);
extern char *func_0202c0c0(int);
extern void func_ov019_021b52f0(void *,int,char *);
int func_ov019_021b2ae8(struct List *ctx) {
    Obj obj;
    Req req;
    u16 colors[16];
    struct List *entry;
    int i, y;
    func_02094504(0,data_ov019_021b5e70,0x4c4);
    func_0208c884((u16 *)0x0400006c,-16);
    func_0208c884((u16 *)0x0400106c,-16);
    func_ov019_021b3f7c(ctx);
    func_0201d47c(&obj);
    obj.resource=func_02006c0c(data_ov019_021b5bd0,4,0);
    obj.mode=3;
    obj.position=0x40;
    obj.enabled=1;
    obj.offset=0;
    obj.layer=3;
    func_0201e5b8(&obj);
    Task_Invoke(obj.resource);
    if(ctx->count>0) {
        func_0201d47c(&obj);
        obj.resource=func_02006c0c(data_ov019_021b5bf0,4,0);
        obj.mode=2;
        obj.position=0x4d00;
        obj.enabled=1;
        obj.offset=0x200;
        obj.layer=2;
        obj.x=13;
        obj.y=3;
        func_0201e5b8(&obj);
        obj.layer=7;
        obj.flag15=1;
        obj.y=8;
        func_0201e5b8(&obj);
        func_0201d47c(&obj);
        obj.resource=func_02006c0c(data_ov019_021b5c0c,4,0);
        obj.mode=2;
        obj.position=0x6640;
        obj.enabled=1;
        obj.offset=0x200;
        obj.layer=7;
        obj.x=13;
        obj.y=13;
        func_0201e5b8(&obj);
        Task_Invoke(obj.resource);
    }
    func_0201d47c(&obj);
    obj.resource=func_02006c0c(data_ov019_021b5c2c,4,0);
    obj.mode=8;
    obj.position=0x40;
    obj.enabled=1;
    obj.offset=0;
    obj.layer=3;
    func_0201e5b8(&obj);
    Task_Invoke(obj.resource);
    if(ctx->count>0) {
        func_0201d47c(&obj);
        obj.resource=func_02006c0c(data_ov019_021b5c4c,4,0);
        obj.mode=7;
        obj.position=0x3780;
        obj.enabled=1;
        obj.offset=0x200;
        obj.layer=2;
        obj.left=0;
        obj.width=28;
        obj.top=0;
        obj.height=3;
        obj.flag14=1;
        for(i=0,y=1;i<(ctx->count>6?6:ctx->count);y+=3,i++) {
            if(i>0) obj.layer=7;
            obj.y=y;
            func_0201e5b8(&obj);
        }
    }
    req=data_ov019_021b5a18;
    func_0201e7e0();
    func_0201ef90((int *)((char *)ctx+0x440),(int *)((char *)ctx+0x444),(int *)((char *)ctx+0x448),0,0,2,&req,1,0x200,(Out *)((char *)ctx+0x4bc));
    func_02001bc8(colors,0x2800,0x76f4);
    func_02094550((int *)colors,(int *)0x05000600,0x20);
    func_02001bc8(colors,0x2800,0x6a82);
    func_02094550((int *)colors,(int *)0x05000640,0x20);
    if(ctx->count>6) {
        int j;
        struct List *cur;
        for(cur=ctx,j=0;j<(ctx->count>6?6:ctx->count)+1;cur=(struct List *)((char *)cur+12),j++) func_ov019_021b40d4((int)ctx,cur->entries[0].id,j);
    } else if(ctx->count>0) {
        int j;
        struct List *cur;
        for(cur=ctx,j=0;j<(ctx->count>6?6:ctx->count);cur=(struct List *)((char *)cur+12),j++) func_ov019_021b40d4((int)ctx,cur->entries[0].id,j);
    }
    func_ov019_021b4258((int *)ctx);
    *(volatile unsigned int *)0x04000000=(*(volatile unsigned int *)0x04000000 & ~0x1f00)|0xc00;
    *(volatile unsigned int *)0x04001000=(*(volatile unsigned int *)0x04001000 & ~0x1f00)|0x1c00;
    *(volatile unsigned int *)0x04000014=0x130;
    *(volatile unsigned int *)0x04000018=0x130;
    if(ctx->count>0) {
        *(int *)(data_ov019_021b6848+0xc0)=ctx->entries[0].id;
        *(int *)(data_ov019_021b6848+0xb8)=1;
        *(int *)(data_ov019_021b6848+0xc4)=-128;
    } else {
        func_ov019_021b52f0(data_ov019_021b6920,1,func_0202c0c0(0x6d2));
    }
    return 1;
}







