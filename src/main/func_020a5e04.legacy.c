extern int func_02096358(int,int,int); extern void WaitByLoop(int);
void func_020a5e04(int arg) {
 if(func_02096358(13,arg,0)==0) return;
 do { WaitByLoop(1); } while(func_02096358(13,arg,0)!=0);
}
