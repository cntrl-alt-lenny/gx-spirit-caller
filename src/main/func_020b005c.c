typedef union { double value; struct { unsigned int lo,hi; } bits; } Double;
double func_020b005c(double value) {
 Double *p=(Double *)&value; p->bits.hi &= 0x7fffffff; return value;
}
