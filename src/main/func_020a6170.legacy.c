extern int data_021a9948; extern int (*data_021a994c)(int);
extern void func_020a6150(void),func_02093bfc(void);
void func_020a6170(int unused,int value) {
 int r;
 if((value&0x3f)==0x11) {
  if(data_021a9948) return;
  r=0; if(data_021a994c) r=data_021a994c(0);
  if(r) func_020a6150();
  data_021a9948=1; return;
 }
 func_02093bfc();
}
