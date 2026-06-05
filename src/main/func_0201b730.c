/* func_0201b730: clear the bits returned by func_0201b6d4(a0) in the system-work
 * flag word at +0x8f4. */
extern int *GetSystemWork(void);
extern int func_0201b6d4(int);
void func_0201b730(int a0){
    int *sys = GetSystemWork();
    *(int *)((char *)sys + 0x8f4) &= ~func_0201b6d4(a0);
}
