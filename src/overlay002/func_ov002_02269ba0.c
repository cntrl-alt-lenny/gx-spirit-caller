extern char *func_0202b7ec(int idx);
extern char *func_0202b830(int idx);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021ae430(int a, const char *src);
extern int func_ov002_021ae484(int x);
extern int func_ov002_021ae4bc(int self, int idx);
extern void func_ov002_021ae514(int,int,int,int,int,int);
extern int func_ov002_021b97d4(int a, unsigned int b);
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_021f4260(int,int);
extern int func_ov002_02281ae8(int self);
extern int func_ov002_02281b5c(int player,int slot);
extern void func_ov002_0229cf10(char *dst,const char *fmt,int val);
extern int data_ov002_022cd744[];
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
extern struct { char pad[0xcec]; int player; char pad2[0x54]; int result; char pad3[0x54]; int state; } data_ov002_022d016c;
extern struct { char pad[0xb0]; unsigned short result; } data_ov002_022d0e6c;
int func_ov002_02269ba0(int player,int id,int arg) {
    int a,b,c;
    char buf2[256];
    char buf1[256];
    int values[2];
    int count,i;
    switch(data_ov002_022d016c.state) {
    case 0:
        if(data_ov002_022cd744[player] == 1) {
            switch(id) {
            case 0xfe0: case 0x1488: case 0x15dd:
                data_ov002_022d0e6c.result=1; break;
            case 0x140d:
                data_ov002_022d0e6c.result=func_ov002_02281ae8(player); break;
            case 0x1544:
                data_ov002_022d0e6c.result=*(int *)(data_ov002_022cf178+(player&1)*0x868)==0; break;
            case 0x153f:
                data_ov002_022d0e6c.result=func_ov002_02281b5c(1-player,arg); break;
            case 0x167a:
                data_ov002_022d0e6c.result=*(int *)(data_ov002_022cf16c+(player&1)*0x868)<*(int *)(data_ov002_022cf16c+((1-player)&1)*0x868); break;
            case 0x1300:
                data_ov002_022d0e6c.result=(data_ov002_022d016c.player!=player && func_ov002_021bbf50(player)>func_ov002_021bbf50(1-player));
                break;
            case 0x12fd:
                data_ov002_022d0e6c.result=(data_ov002_022d016c.player!=player && *(int *)(data_ov002_022cf16c+(player&1)*0x868)<0xbb8);
                break;
            case 0x1932:
                data_ov002_022d0e6c.result=data_ov002_022d016c.player!=player; break;
            default: data_ov002_022d0e6c.result=0; break;
            }
            return 1;
        }
        data_ov002_022d016c.state++;
        return 0;
    case 1:
        switch(id) {
        case 0x10d6: func_ov002_021ae430(player,(const char *)0x1ac); break;
        case 0x12f3: case 0x14b3: case 0x1a19: case 0x1a50: case 0x1a67:
            func_ov002_021ae400(player,0x11); break;
        case 0x135b:
            if(arg) func_ov002_021ae400(player,0x11);
            else func_ov002_021ae400(player,0xed);
            break;
        case 0x1357: func_ov002_021ae430(player,func_0202b7ec(arg)); break;
        case 0x139c: func_ov002_021ae484(0xe1); break;
        case 0x140d: func_ov002_021ae484(0xb); break;
        case 0x1488: func_ov002_021ae4bc(0xe,func_ov002_021b97d4(player,id)); break;
        case 0x153f:
            a=func_ov002_021f4260(id,0);
            b=func_ov002_021f4260(id,1);
            c=func_ov002_021f4260(id,2);
            func_ov002_021ae514(0x104,a,b,c,0,15); break;
        case 0x1544:
            a=0;
            if(*(int *)(data_ov002_022cf178+(player&1)*0x868)!=0) a|=1;
            if(func_ov002_021bbf50(player)!=0) a|=2;
            b=func_ov002_021f4260(id,0);
            c=func_ov002_021f4260(id,1);
            func_ov002_021ae514(0x103,b,c,0,0,a); break;
        case 0x15dd: func_ov002_021ae484(0x55); break;
        case 0x15f3: func_ov002_021ae400(player,0x7b); break;
        case 0x167a: func_ov002_021ae484(0x12a); break;
        case 0x1516: case 0x16df: func_ov002_021ae400(player,0x3a); break;
        case 0x1717: func_ov002_021ae400(player,0xd); break;
        case 0x171f: case 0x197d: case 0x19c2:
            func_ov002_021ae430(player,func_0202b830(arg)); break;
        case 0x1739:
            count=0;
            for(i=1;i<=6;i++) { if(arg&(1<<i)) values[count++]=i; }
            func_ov002_0229cf10(buf1,(const char *)0x129,values[0]);
            func_ov002_0229cf10(buf2,buf1,values[1]);
            func_ov002_021ae400(player,(int)buf2); break;
        case 0x17c3: func_ov002_021ae484(0x2f); break;
        case 0x1968: func_ov002_021ae400(player,0x1f); break;
        case 0x198e:
            if(arg) func_ov002_021ae400(player,0x141);
            else func_ov002_021ae400(player,0x122);
            break;
        default: func_ov002_021ae4bc(0xfa,func_ov002_021b97d4(player,id)); break;
        }
        data_ov002_022d016c.state++;
        return 0;
    default:
        data_ov002_022d0e6c.result=data_ov002_022d016c.result;
        return 1;
    }
}

