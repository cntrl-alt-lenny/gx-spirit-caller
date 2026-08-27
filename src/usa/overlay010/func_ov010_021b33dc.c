/* func_ov010_021b33dc: same shape as func_ov018_021aa7a0 -- build two
 * sprite handles via func_0201ed58 / func_0201ed90, blit each through
 * func_0207f528 / func_0207f428, then invoke both tasks.
 */

extern int func_0201ed58(int *out, int cfg);
extern int func_0201ed90(int *out, int cfg);
extern void func_0207f528(int s, int b, int c, void *d);
extern void func_0207f428(int s, int b, int c, void *d);
extern void Task_Invoke(int h);
extern int data_ov010_021b8960[2];
extern char data_ov010_021b8be4[];
extern char data_ov010_021b8bd0[];

void func_ov010_021b33dc(int a0, int a1, int a2) {
    int s1;
    int s0;
    int h1;
    int h2;
    h1 = func_0201ed58(&s1, data_ov010_021b8960[0]);
    func_0207f528(s1, a1, a0, data_ov010_021b8be4);
    Task_Invoke(h1);
    h2 = func_0201ed90(&s0, data_ov010_021b8960[1]);
    func_0207f428(s0, a2, a0, data_ov010_021b8bd0);
    Task_Invoke(h2);
}
