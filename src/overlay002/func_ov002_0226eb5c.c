typedef struct { unsigned short id:13; unsigned short rest:3; unsigned short pad; } Entry;
extern Entry data_ov002_022d0250[];
extern int data_ov002_022cd73c[];
extern char data_ov002_022d016c[];
extern char data_ov002_022cf178[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b890(int id);
extern int func_0202e234(int x);
extern int func_0202e42c(int x);
extern int func_0202eac8(int id);
extern int func_0202f050(int x);
extern int func_020305d8(int arg);
extern int func_02031838(int x);
extern int func_ov002_021b3fd8(int arg0,int arg1,int arg2,int arg3);
extern int func_ov002_021bb068(int id);
/* The original sets only r0 and r1 for this four-argument thunk. */
extern int func_ov002_021bb90c();
extern int func_ov002_021bba5c(int self,int arg1,int arg2);
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_021bc000(int player,int (*fn)(int));
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bcb10(int self,int id,int check);
extern int func_ov002_021bd85c(int a,int b);
extern int func_ov002_021c38c4(int side,int index);
extern int func_ov002_021c9be8(int arg0,int arg1);
extern int func_ov002_021c9c94(int arg0);
extern int func_ov002_021c9e14(int arg0);
extern int func_ov002_0226e80c(int player,int card);
extern int func_ov002_0226e918(int arg0,int arg1);
extern int func_ov002_0226e9ac(int arg0,int arg1);
extern int func_ov002_0226e9fc(int a,int b);
extern int func_ov002_0226ea7c(int arg0,int arg1);
extern int func_ov002_0226ead0(int player,int arg1);
int func_ov002_0226eb5c(int player,int index,int mode,int kind) {
 int id = data_ov002_022d0250[index].id;
 int result=0;
 int a=0x10;
 int b=0x40;
 if (!id) return 0;
 if (!func_0202e234(id)) return 0;
 if (func_ov002_021bd85c(id,-1)) {
  if (player==data_ov002_022cd73c[1]) *(int *)(data_ov002_022d016c+0xd80)=a;
  return 0;
 }
 if (!func_ov002_021c9be8(player,id)) {
  if (player==data_ov002_022cd73c[1]) *(int *)(data_ov002_022d016c+0xd80)=0x17;
  return 0;
 }
 if (!func_020305d8(id)) return 0;
 if (func_ov002_021bb068(0x135d)) {a=0x50;b=0;}
 if (!func_ov002_021c9e14(player)) {
  a=0;
  if (player==data_ov002_022cd73c[1]) *(int *)(data_ov002_022d016c+0xd80)=0x11;
 }
 if (func_ov002_021bba5c(1-player,0x197d,func_0202b890(id))) {
  a=0;
  if (player==data_ov002_022cd73c[1]) *(int *)(data_ov002_022d016c+0xd80)=0x11;
 }
 if (!func_ov002_021c9c94(player)) b=0;
 switch(id) {
 case 0x1386:case 0x1387:case 0x1388:case 0x1905:
  if(kind) return 0;
  if(!func_ov002_0226ead0(player,0)) {
   if(player==data_ov002_022cd73c[1]) *(int *)(data_ov002_022d016c+0xd80)=0xb;
   return 0;
  }
  if(func_ov002_021bcb10(player,id,1)>=3) {result |= a; result |= b;}
  if(!result) {
   if(player==data_ov002_022cd73c[1]) *(int *)(data_ov002_022d016c+0xd80)=0;
   return 0;
  }
  return result;
 case 0x16ec:case 0x1725:case 0x1729:case 0x1985:case 0x1986:case 0x1b2e:case 0x1b2f:
  if(func_ov002_0226e80c(player,id)) result|=a|b;
  return result;
 case 0x147b:
  if(!kind && *(unsigned int *)(data_ov002_022cf178+(player&1)*0x868)==1) {
   if(func_ov002_021bc618(player) && mode) result|=a;
  }
  break;
 case 0x14db:
  if(func_ov002_021bbf50(player)) a=0;
  break;
 case 0x158b:case 0x160f:
  if(func_ov002_021bb90c(player,id)) a=0;
  break;
 case 0x164a:case 0x164b:case 0x164c:case 0x164d:case 0x164e:case 0x164f:
  if(!func_ov002_021bb90c(player,func_02031838(id))) a=0;
  break;
 case 0x1691:
  if(!func_ov002_021bc000(player,func_0202e42c)) a=0;
  break;
 case 0x17d8:case 0x1823:a=0;break;
 case 0x1838:
  if(!kind && func_ov002_021bc618(player) && mode) result|=a|b;
  break;
 case 0x1864:
  if(mode && !kind) {
   if(!func_ov002_0226ead0(player,0)) {
    if(player==data_ov002_022cd73c[1]) *(int *)(data_ov002_022d016c+0xd80)=0xb;
   } else {
    if(func_ov002_021bcb10(player,id,1)>=1) {result |= a; result |= b;}
    if(!result && player==data_ov002_022cd73c[1]) *(int *)(data_ov002_022d016c+0xd80)=0;
   }
  }
  break;
 case 0x194c:
  if(*(unsigned int *)(data_ov002_022cf178+(player&1)*0x868)<=1) return 0;
  if(!func_ov002_0226ead0(player,0)) {
   if(player==data_ov002_022cd73c[1]) *(int *)(data_ov002_022d016c+0xd80)=0xb;
   return 0;
  }
  if(func_ov002_021bcb10(player,id,1)>=1) result|=a|b;
  return result;
 case 0x1a20:
  if(!kind && func_ov002_021bc618(player) && mode) result|=a;
  break;
 case 0x1a21:
  if(mode && !kind) {
   if(!func_ov002_0226ead0(player,0)) {
    if(player==data_ov002_022cd73c[1]) *(int *)(data_ov002_022d016c+0xd80)=0xb;
   } else {
    if(func_ov002_021bcb10(player,id,1)>=1) result|=a;
    if(!result && player==data_ov002_022cd73c[1]) *(int *)(data_ov002_022d016c+0xd80)=0;
   }
  }
  break;
 case 0x1a96:case 0x1b2d:
  if(!kind && mode && func_ov002_0226e918(player,id)) result|=a;
  break;
 }
 if(!kind && mode) {
  if(func_0202eac8(id) && func_ov002_0226e9ac(player,index)) result|=a;
  if(func_0202f050(id) && func_ov002_0226e9fc(player,index)) result|=a|b;
  if(func_0202b878(id)==9 && func_ov002_0226ea7c(player,index)) result|=a;
  if(mode!=2 && func_0202f050(id) && func_ov002_021b3fd8(player,0xb,0x19ad,index) && func_ov002_021bc618(player)) result|=a;
 }
 if(mode==2) return result;
 switch(func_ov002_021c38c4(player,index)) {
 case 0:case 1:case 2:case 3:case 4:
  if(!kind) {
   if(!func_ov002_021bc618(player)) {
    if(player==data_ov002_022cd73c[1]) *(int *)(data_ov002_022d016c+0xd80)=0xb;
   } else result|=a|b;
  }
  break;
 case 5:case 6:
  if(kind==1 && func_ov002_021bc618(player)) {result |= a; result |= b;}
  else if(kind) break;
  if(!func_ov002_0226ead0(player,0)) {
   if(player==data_ov002_022cd73c[1]) *(int *)(data_ov002_022d016c+0xd80)=0xb;
  } else {
   if(func_ov002_021bcb10(player,id,1)>=1) result|=a;
   if(func_ov002_021bcb10(player,id,0)>=1) result|=b;
   if(!result && player==data_ov002_022cd73c[1]) *(int *)(data_ov002_022d016c+0xd80)=0;
  }
  break;
 default:
  if(kind==2 && func_ov002_021bc618(player)) {result |= a; result |= b;}
  else if(kind) break;
  if(!func_ov002_0226ead0(player,0)) {
   if(player==data_ov002_022cd73c[1]) *(int *)(data_ov002_022d016c+0xd80)=0xb;
  } else {
   if(func_ov002_021bcb10(player,id,1)>=2) result|=a;
   if(func_ov002_021bcb10(player,id,0)>=2) result|=b;
   if(!result && player==data_ov002_022cd73c[1]) *(int *)(data_ov002_022d016c+0xd80)=0;
  }
  break;
 }
 return result;
}


