typedef struct { unsigned char sign,pad; short exponent; unsigned char count,digits[32]; } Decimal;
extern int func_020b0390(Decimal *,int); extern void func_020b03fc(Decimal *,int);
void func_020b044c(Decimal *p,int count) {
 int round;
 if(count<=0) return;
 if(count>=p->count) return;
 round=func_020b0390(p,count); p->count=count;
 if(round<0) return;
 func_020b03fc(p,count);
}
