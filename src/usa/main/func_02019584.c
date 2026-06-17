/* func_02019584: SysWork stride-24 entry byte (entry[a1+20]). PERMUTER-matched
 * (brief 363): the commutative `e+a1` add-order is mwcc-canonicalised; the
 * permuter found the var-reuse form that flips it. */
extern char *GetSystemWork(void);
extern int func_020191dc(int);
int func_02019584(int a0, int a1)
{
  char *sys = GetSystemWork();
  int k = func_020191dc(a0);
  char *e = sys + ((k - 1) * 24);
  sys = e + a1;
  return *((unsigned char *) (sys + 20));
}
