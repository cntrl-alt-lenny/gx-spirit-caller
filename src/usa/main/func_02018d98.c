/* func_02018d98: SysWork stride-24 entry, bit 0 of f16. PERMUTER-matched
 * (brief 363): `(v<<31)>>31` peepholes to `and#1` under 2.0; the permuter
 * routed the shift amount through vars to keep the orig lsl/lsr. */
extern char *GetSystemWork(void);
extern int func_020191dc(int);
int func_02018d98(int a0)
{
  int new_var2;
  char *sys = GetSystemWork();
  int k = func_020191dc(a0);
  unsigned int new_var3;
  int new_var;
  unsigned v = *((unsigned *) ((sys + ((k - 1) * 24)) + 16));
  new_var2 = (new_var = 31);
  new_var3 = new_var;
  return (v << new_var2) >> new_var3;
}
