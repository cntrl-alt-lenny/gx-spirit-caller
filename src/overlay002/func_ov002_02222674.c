typedef unsigned short u16;
struct Self { u16 card; u16 side:1; u16 slot:5; u16 rest:10; };
struct State { char pad[0x5a8]; int state; };
struct Info { char pad[0xb0]; u16 value; };
struct Flag { char pad[0xd44]; int flag; };
extern struct State data_ov002_022ce288;
extern struct Info data_ov002_022d0e6c;
extern int data_ov002_022cd744[];
extern struct Flag data_ov002_022d016c;
extern int func_ov002_021ae484(int x);
extern void func_ov002_021af9d0(int a,int b,int c,int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021ca2b8();
extern int func_ov002_0225368c(int ctx,int card_id,int arg2);
extern int func_ov002_0226b258();
extern int func_ov002_0227adb8(int a,int b,int c,int d);
int func_ov002_02222674(struct Self *self) {
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_021ca2b8(self->side) == 0) return 0;
        if (func_ov002_021bc618(self->side) == 0) return 0;
        func_ov002_0226b258(self->side,self->slot);
        return 0x7f;
    case 0x7f:
        if (func_ov002_0225368c(self->side,self->card,data_ov002_022d0e6c.value) == 0) return 0;
        if (data_ov002_022cd744[self->side] == 1) data_ov002_022d016c.flag = 1;
        else func_ov002_021ae484(0x2f);
        return 0x7e;
    case 0x7e:
        if (data_ov002_022d016c.flag == 0) return 0;
        func_ov002_021af9d0(self->side,6,self->card,data_ov002_022d0e6c.value);
        return 0x7d;
    case 0x7d:
        func_ov002_0227adb8(self->side,(int)func_ov002_021afb74(),1,0);
        return 0;
    }
    return 0;
}

