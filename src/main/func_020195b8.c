/* func_020195b8: SysWork stride-24 entry byte (entry[a1+20]). PERMUTER-matched
 * (brief 363): the commutative `e+a1` add-order is mwcc-canonicalised; the
 * permuter found the var-reuse form that flips it. */
extern char *GetSystemWork(void);
extern int func_02019210(int);
int func_020195b8(int a0, int a1)
{
  char *sys = GetSystemWork();
  int k = func_02019210(a0);
  char *e = sys + ((k - 1) * 24);
  sys = e + a1;
  return *((unsigned char *) (sys + 20));
}
