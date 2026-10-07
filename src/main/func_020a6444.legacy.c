extern int data_021a9944,data_021a9948; extern int (*data_021a994c)(int);
extern unsigned char data_021a9a20[];
extern void func_020a60fc(void),func_02096228(void *),func_020a622c(void);
extern int func_0209640c(int,int); extern void func_02096434(int,int);
extern void func_020a61f0(int,int); extern void func_020a6170(int,int); extern void func_020a613c(void);
extern void func_020a6614(void *); extern void func_020a5db0(int);
void func_020a6444(void) {
 if(data_021a9944) return;
 data_021a9944=1; func_020a60fc(); data_021a9948=0; func_02096228(&data_021a9948);
 while(func_0209640c(13,1)==0) {}
 func_02096434(13,(int)func_020a61f0); func_020a622c(); func_02096434(13,0);
 func_02096434(13,(int)func_020a6170); data_021a994c=0;
 func_020a6614(data_021a9a20); func_02096434(17,(int)func_020a613c); func_020a5db0(0);
}
