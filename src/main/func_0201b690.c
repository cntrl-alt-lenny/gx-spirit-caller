/* func_0201b690: SysWork stride-24 entry, low byte of f8. PERMUTER-matched
 * (brief 363): `(v<<24)>>24` peepholes to `and#0xff`; the permuter split the
 * shift across statements to keep the orig lsl/lsr. */
extern char *GetSystemWork(void);
extern int func_02019210(int);
int func_0201b690(int a0)
{
  char *sys = GetSystemWork();
  int k = func_02019210(a0);
  unsigned new_var;
  unsigned v = *((unsigned *) ((sys + ((k - 1) * 24)) + 8));
  k = v << 24;
  new_var = k;
  return new_var >> 24;
}
