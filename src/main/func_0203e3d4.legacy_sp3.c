/* func_0203e3d4: clamp a2 to 12, look it up in data_020bec58, OR with a3, and
 * forward to func_0207be90(a0,a1,merged). SP3 tier (1.2/sp3). */
extern int data_020bec58[];
extern void func_0207be90(int, int, int);
void func_0203e3d4(int a0, int a1, int a2, int a3){
    if (a2 > 12) a2 = 12;
    func_0207be90(a0, a1, a3 | data_020bec58[a2]);
}
